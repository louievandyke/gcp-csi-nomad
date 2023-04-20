
# Provision a Nomad cluster on GCP with Google Compute Engine - Persistent Disk


1. #### Login to google cloud:
   ```
    gcloud auth login
   ```

2. #### Create a temporary [project via doormat](https://doormat.hashicorp.services/gcp/project/temp/create), and then set it like this:

   #### The new GCP doormat process allows for temporary accounts to be created for up to seven days.  Once your project is approved please note the project id that is created and use it below.
   
   ```
   export GOOGLE_PROJECT=<your project id>
   ```

   ```
   gcloud config set project $GOOGLE_PROJECT
   ```

3. #### Create Terraform Service Account.

    ie.) 
    Create a Terraform Service Account user and its `account.json` credentials file:
    ```
    gcloud iam service-accounts create terraform \
    --display-name "Terraform Service Account" \
    --description "Service account to use with Terraform"
    ```
    
    ```
    gcloud projects add-iam-policy-binding "$GOOGLE_PROJECT" \
    --member serviceAccount:"terraform@$GOOGLE_PROJECT.iam.gserviceaccount.com" \
    --role roles/editor
    ```
    
    ```
    gcloud iam service-accounts keys create account.json \
    --iam-account "terraform@$GOOGLE_PROJECT.iam.gserviceaccount.com"
    ```
   ##### csi specific services and policy binding
        
    ```
    gcloud services enable \
    iam.googleapis.com \
    file.googleapis.com \
    cloudresourcemanager.googleapis.com
    ```
    
    ```
    gcloud projects add-iam-policy-binding "$GOOGLE_PROJECT" \
    --member serviceAccount:"terraform@$GOOGLE_PROJECT.iam.gserviceaccount.com" \
    --role roles/owner
    ```
    
    Now set the full path of the newly created account.json file as `GOOGLE_APPLICATION_CREDENTIALS` environment variable.
    
    ```
    export GOOGLE_APPLICATION_CREDENTIALS=$(realpath account.json)
    ```
    eg.
    `export GOOGLE_APPLICATION_CREDENTIALS=/Users/louvandyke/gcp-csi-nomad/account.json`
    
#### Ensure Required Environment Variables Are Set
Before moving onto the next steps, ensure the following environment variables are set:

* `GOOGLE_PROJECT` with your selected GCP project ID.
* `GOOGLE_APPLICATION_CREDENTIALS` with the full path to the Terraform Service Account account.json credentials file created in the last step.

4.  Change into the gcp directory:  Build the packer image.

    ```
    cd gcp
    packer build packer.json
    ```
    
5. Change into the env/us-east environment directory:

    ```
    cd env/us-east
    ```

    Initialize Terraform:
    ```
    terraform init
    ```
    Plan infrastructure changes with Terraform:
    ```
    terraform plan -var="project=${GOOGLE_PROJECT}" -var="credentials=${GOOGLE_APPLICATION_CREDENTIALS}"
    ```
    Apply infrastructure changes with Terraform:
    ```
    terraform apply -auto-approve -var="project=${GOOGLE_PROJECT}" -var="credentials=${GOOGLE_APPLICATION_CREDENTIALS}"
    ```
    
    
#### Access the Cluster

To access the Nomad, Consul, or Vault web UI inside the cluster, create an [SSH tunnel](https://cloud.google.com/community/tutorials/ssh-tunnel-on-gce) using gcloud. To open up tunnels to all of the UIs available in the cluster, run these commands which will start each SSH tunnel as a background process in your current shell:

```
gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:4646:127.0.0.1:4646
gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:8500:127.0.0.1:8500
gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:8200:127.0.0.1:8200
```


* [Nomad](http://127.0.0.1:4646/)
* [Vault](http://127.0.0.1:8200/)
* [Consul](http://127.0.0.1:8500/)



#### Enable privileged Docker containers

Update the Nomad configuration on any client that you want to mount a disk to enable privileged docker containers.

```
gcloud compute ssh hashistack-client-1 --zone=us-east1-c --tunnel-through-iap
```


You can use this command once connected to a client node to create a suitable configuration file, restart Nomad, and exit.


```bash=
echo 'plugin "docker" {
  config {
    allow_privileged = true
  }
}' | sudo tee /etc/nomad.d/docker.hcl
sudo systemctl restart nomad
sleep 10
sudo systemctl --no-pager status nomad
exit
```

#### Start working with the CSI folder
```
mkdir -p ~/csi
terraform output > ~/csi/disks.out
cp nomad-sa-key.json ~/csi
```

#### You should be able to work from the csi folder at this point.

```
cd ~/csi
consul kv put service_account @nomad-sa-key.json
```

#### Create the files you’ll need for Nomad
##### controller.nomad


```bash=
job "controller" {
  datacenters = ["dc1"]
  group "controller" {
    task "plugin" {
      driver = "docker"
      template {
        data = <<EOH
{{ key "service_account" }}
EOH
  destination = "secrets/creds.json"
      }
       env {
           "GOOGLE_APPLICATION_CREDENTIALS" = "/secrets/creds.json"
        }
      config {
        image = "gcr.io/gke-release/gcp-compute-persistent-disk-csi-driver:v0.7.0-gke.0"
       args = [
          "--endpoint=unix:///csi/csi.sock",
          "--v=6",
          "--logtostderr",
          "--run-node-service=false"
        ]
      }
      csi_plugin {
        id        = "gcepd"
        type      = "controller"
        mount_dir = "/csi"
      }
      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
```

##### nodes.nomad

```bash=
job "nodes" {
  datacenters = ["dc1"]
  type = "system"
  group "nodes" {
    task "plugin" {
      driver = "docker"
      template {
        data = <<EOH
{{ key "service_account" }}
EOH
  destination = "secrets/creds.json"
      }
      env { "GOOGLE_APPLICATION_CREDENTIALS" = "/secrets/creds.json"
      }
      config {
        image = "gcr.io/gke-release/gcp-compute-persistent-disk-csi-driver:v0.7.0-gke.0"
        args = [
          "--endpoint=unix:///csi/csi.sock",
          "--v=6",
          "--logtostderr",
          "--run-controller-service=false"
        ]
        privileged = true
      }
      csi_plugin {
        id        = "gcepd"
        type      = "node"
        mount_dir = "/csi"
      }
      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
```


##### alpine.nomad
```bash=
job "alpine" {
  datacenters = ["dc1"]

  group "alloc" {
    restart {
      attempts = 10
      interval = "5m"
      delay    = "25s"
      mode     = "delay"
    }

    volume "jobVolume" {
      type      = "csi"
      read_only = false
      source    = "disk-0"
      access_mode = "file-system"
      attachment_mode = "single-node-writer"
    }

    task "docker" {
      driver = "docker"

      volume_mount {
        volume      = "jobVolume"
        destination = "/srv"
        read_only   = false
      }

      config {
        image = "alpine"
        command = "sh"
        args = ["-c","while true; do sleep 10; done"]
      }
    }
  }
}
```

##### volume.hcl

Look at the file you created called disks.out. Select a volume and copy out its URL from the output. Take everything after `https://www.googleapis.com/compute/v1/`` and paste it into the external_id value.

```bash=
type = "csi"
id = "disk-0"
name = "disk-0"
external_id = "projects/«gcp-project-id»/zones/us-east1-c/disks/hashistack-csi-disk-0"
access_mode = "single-node-writer"
attachment_mode = "file-system"
plugin_id = "gcepd"
```

Run controller.nomad and nodes.nomad

```
nomad run controller.nomad
nomad run nodes.nomad
```

Run nomad plugin status to verify that all
of the controller and node instances are up and healthy

```
nomad plugin status
```

Register the volume using the `nomad volume register` command.
```
nomad volume register volume.hcl
```

Check that your volume is listed in nomad volume status

```bash=
$ nomad volume status
Container Storage Interface
ID      Name    Plugin ID  Schedulable  Access Mode
disk-0  disk-0  gcepd      true         single-node-writer
```

You can get extended information about your CSI disk bt adding its identifier to the volume status command.


```bash=
$ nomad volume status disk-0
ID                   = disk-0
Name                 = disk-0
External ID          = projects/«project_id»/zones/«gcp_zone»/disks/hashistack-csi-disk-0
Plugin ID            = gcepd
Provider             = pd.csi.storage.gke.io
Version              = v0.7.0-gke.0
Schedulable          = true
Controllers Healthy  = 1
Controllers Expected = 1
Nodes Healthy        = 3
Nodes Expected       = 3
Access Mode          = single-node-writer
Attachment Mode      = file-system
Mount Options        = <none>
Namespace            = default

Allocations
No allocations placed
```

Next, run the alpine.nomad file.
```
nomad run alpine.nomad
```

Then verify the allocation is associated with the disk

```
$ nomad volume status disk-0
ID                   = disk-0
Name                 = disk-0
External ID          = projects/«project_id»/zones/«gcp_zone»/disks/hashistack-csi-disk-0
Plugin ID            = gcepd
Provider             = pd.csi.storage.gke.io
Version              = v0.7.0-gke.0
Schedulable          = true
Controllers Healthy  = 1
Controllers Expected = 1
Nodes Healthy        = 3
Nodes Expected       = 3
Access Mode          = single-node-writer
Attachment Mode      = file-system
Mount Options        = <none>
Namespace            = default

Allocations
ID        Node ID   Task Group  Version  Desired  Status   Created  Modified
0fb4b9d0  b9438f36  alloc       0        run      running  44s ago  18s ago
```

Use nomad alloc exec to connect to the alpine container.

`nomad alloc exec -i -t -task alloc 0fb4b9d0 /bin/sh`


