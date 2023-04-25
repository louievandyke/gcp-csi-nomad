
```
➜  gcp-csi-nomad git:(main) gcloud auth login
Your browser has been opened to visit:

    https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=32555940559.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A8085%2F&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fappengine.admin+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fsqlservice.login+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcompute+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Faccounts.reauth&state=YW5tU9qvmPRVqImFHbgvvdNghrZnsf&access_type=offline&code_challenge=yyFuCdhIjBNgNWicS0XX03h_tr6yVEDCToco-7jVkXA&code_challenge_method=S256


You are now logged in as [lvandyke@hashicorp.com].
Your current project is [hc-3adeabb662c74193bd851ae5290].  You can change this setting by running:
  $ gcloud config set project PROJECT_ID


Updates are available for some Google Cloud CLI components.  To install them,
please run:
  $ gcloud components update
```

```
➜  gcp-csi-nomad git:(main) export GOOGLE_PROJECT=hc-e97f2ec769f746e995e1f7ae7de
```

```
➜  gcp-csi-nomad git:(main) gcloud config set project $GOOGLE_PROJECT

Updated property [core/project].
➜  gcp-csi-nomad git:(main) gcloud iam service-accounts create terraform \
--display-name "Terraform Service Account" \
--description "Service account to use with Terraform"
Created service account [terraform].
➜  gcp-csi-nomad git:(main) gcloud projects add-iam-policy-binding "$GOOGLE_PROJECT" \
--member serviceAccount:"terraform@$GOOGLE_PROJECT.iam.gserviceaccount.com" \
--role roles/editor
Updated IAM policy for project [hc-e97f2ec769f746e995e1f7ae7de].
bindings:
- members:
  - group:gcpsg-project-hc-e97f2ec769f746e995e1f7ae7de-developer@hashicorp.com
  role: organizations/1091910689833/roles/doormat_temp_editor_supplement
- members:
  - serviceAccount:906183014384@cloudbuild.gserviceaccount.com
  role: roles/cloudbuild.builds.builder
- members:
  - serviceAccount:service-906183014384@gcp-sa-cloudbuild.iam.gserviceaccount.com
  role: roles/cloudbuild.serviceAgent
- members:
  - serviceAccount:service-906183014384@gcf-admin-robot.iam.gserviceaccount.com
  role: roles/cloudfunctions.serviceAgent
- members:
  - serviceAccount:service-906183014384@compute-system.iam.gserviceaccount.com
  role: roles/compute.serviceAgent
- members:
  - serviceAccount:service-906183014384@container-engine-robot.iam.gserviceaccount.com
  role: roles/container.serviceAgent
- members:
  - serviceAccount:service-906183014384@containerregistry.iam.gserviceaccount.com
  role: roles/containerregistry.ServiceAgent
- members:
  - group:gcpsg-project-hc-e97f2ec769f746e995e1f7ae7de-developer@hashicorp.com
  - serviceAccount:906183014384-compute@developer.gserviceaccount.com
  - serviceAccount:906183014384@cloudservices.gserviceaccount.com
  - serviceAccount:hc-e97f2ec769f746e995e1f7ae7de@appspot.gserviceaccount.com
  - serviceAccount:terraform@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com
  role: roles/editor
- members:
  - serviceAccount:service-906183014384@cloud-filer.iam.gserviceaccount.com
  role: roles/file.serviceAgent
- members:
  - group:gcpsg-project-hc-e97f2ec769f746e995e1f7ae7de-admin@hashicorp.com
  - serviceAccount:doormat-project-manager@hc-3932b58215a24fe08792a3b0414.iam.gserviceaccount.com
  role: roles/owner
- members:
  - serviceAccount:service-906183014384@gcp-sa-pubsub.iam.gserviceaccount.com
  role: roles/pubsub.serviceAgent
- members:
  - serviceAccount:service-906183014384@serverless-robot-prod.iam.gserviceaccount.com
  role: roles/run.serviceAgent
- members:
  - group:gcpsg-project-hc-e97f2ec769f746e995e1f7ae7de-viewer@hashicorp.com
  role: roles/viewer
- members:
  - serviceAccount:service-906183014384@gcp-sa-vpcaccess.iam.gserviceaccount.com
  role: roles/vpcaccess.serviceAgent
etag: BwX6G41FCRw=
version: 1
➜  gcp-csi-nomad git:(main) gcloud iam service-accounts keys create account.json \
--iam-account "terraform@$GOOGLE_PROJECT.iam.gserviceaccount.com"
created key [7c300997eb2526ef43a65b85bebfcb66ff792736] of type [json] as [account.json] for [terraform@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com]
```

```
➜  gcp-csi-nomad git:(main) gcloud services enable \
iam.googleapis.com \
file.googleapis.com \
cloudresourcemanager.googleapis.com
ERROR: (gcloud.services.enable) User [lvandyke@hashicorp.com] does not have permission to access projects instance [hc-e97f2ec769f746e995e1f7ae7de] (or it may not exist): Permission denied to enable service [file.googleapis.com]
Help Token: AT1-yKFTtRXD5SMeFe0fWkPZQCzTtVIbYLCd6OKbY5hdiQG2Jsd4rTy_bHbk1luLeOoDD9fPtDjMLW_xs6QKOfHgvRbSRwjC_XUcaJkl5YTP3NmO
- '@type': type.googleapis.com/google.rpc.PreconditionFailure
  violations:
  - subject: ?error_code=110002&service=serviceusage.googleapis.com&permission=serviceusage.services.enable&resource=hc-e97f2ec769f746e995e1f7ae7de
    type: googleapis.com
- '@type': type.googleapis.com/google.rpc.ErrorInfo
  domain: serviceusage.googleapis.com
  metadata:
    permission: serviceusage.services.enable
    resource: hc-e97f2ec769f746e995e1f7ae7de
    service: serviceusage.googleapis.com
  reason: AUTH_PERMISSION_DENIED
➜  gcp-csi-nomad git:(main) gcloud services enable \
iam.googleapis.com \
file.googleapis.com \
cloudresourcemanager.googleapis.com
Operation "operations/acat.p2-906183014384-2436a2b8-757f-42b3-9800-12892d6f7454" finished successfully.
➜  gcp-csi-nomad git:(main) gcloud projects add-iam-policy-binding "$GOOGLE_PROJECT" \
--member serviceAccount:"terraform@$GOOGLE_PROJECT.iam.gserviceaccount.com" \
--role roles/owner
Updated IAM policy for project [hc-e97f2ec769f746e995e1f7ae7de].
bindings:
- members:
  - group:gcpsg-project-hc-e97f2ec769f746e995e1f7ae7de-developer@hashicorp.com
  role: organizations/1091910689833/roles/doormat_temp_editor_supplement
- members:
  - serviceAccount:906183014384@cloudbuild.gserviceaccount.com
  role: roles/cloudbuild.builds.builder
- members:
  - serviceAccount:service-906183014384@gcp-sa-cloudbuild.iam.gserviceaccount.com
  role: roles/cloudbuild.serviceAgent
- members:
  - serviceAccount:service-906183014384@gcf-admin-robot.iam.gserviceaccount.com
  role: roles/cloudfunctions.serviceAgent
- members:
  - serviceAccount:service-906183014384@compute-system.iam.gserviceaccount.com
  role: roles/compute.serviceAgent
- members:
  - serviceAccount:service-906183014384@container-engine-robot.iam.gserviceaccount.com
  role: roles/container.serviceAgent
- members:
  - serviceAccount:service-906183014384@containerregistry.iam.gserviceaccount.com
  role: roles/containerregistry.ServiceAgent
- members:
  - group:gcpsg-project-hc-e97f2ec769f746e995e1f7ae7de-developer@hashicorp.com
  - serviceAccount:906183014384-compute@developer.gserviceaccount.com
  - serviceAccount:906183014384@cloudservices.gserviceaccount.com
  - serviceAccount:hc-e97f2ec769f746e995e1f7ae7de@appspot.gserviceaccount.com
  - serviceAccount:terraform@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com
  role: roles/editor
- members:
  - serviceAccount:service-906183014384@cloud-filer.iam.gserviceaccount.com
  role: roles/file.serviceAgent
- members:
  - group:gcpsg-project-hc-e97f2ec769f746e995e1f7ae7de-admin@hashicorp.com
  - serviceAccount:doormat-project-manager@hc-3932b58215a24fe08792a3b0414.iam.gserviceaccount.com
  - serviceAccount:terraform@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com
  role: roles/owner
- members:
  - serviceAccount:service-906183014384@gcp-sa-pubsub.iam.gserviceaccount.com
  role: roles/pubsub.serviceAgent
- members:
  - serviceAccount:service-906183014384@serverless-robot-prod.iam.gserviceaccount.com
  role: roles/run.serviceAgent
- members:
  - group:gcpsg-project-hc-e97f2ec769f746e995e1f7ae7de-viewer@hashicorp.com
  role: roles/viewer
- members:
  - serviceAccount:service-906183014384@gcp-sa-vpcaccess.iam.gserviceaccount.com
  role: roles/vpcaccess.serviceAgent
etag: BwX6G5Hq4jE=
version: 1
```

```
➜  gcp-csi-nomad git:(main) pwd
/Users/louvandyke/baz/gcp-csi-nomad
```

```
➜  gcp-csi-nomad git:(main) export GOOGLE_APPLICATION_CREDENTIALS=/Users/louvandyke/baz/gcp-csi-nomad/account.json
```

```
➜  gcp-csi-nomad git:(main) export GOOGLE_APPLICATION_CREDENTIALS=/Users/louvandyke/baz/gcp-csi-nomad/account.json
```

```
➜  gcp-csi-nomad git:(main) echo $GOOGLE_PROJECT
hc-e97f2ec769f746e995e1f7ae7de
```

```
➜  gcp-csi-nomad git:(main) echo $GOOGLE_APPLICATION_CREDENTIALS
/Users/louvandyke/baz/gcp-csi-nomad/account.json
```

```
➜  gcp-csi-nomad git:(main) cd gcp
```

```
➜  gcp git:(main) packer build packer.json
hashistack: output will be in this color.

==> hashistack: Checking image does not exist...
==> hashistack: Creating temporary RSA SSH key for instance...
==> hashistack: Using image: ubuntu-1804-bionic-v20230418
==> hashistack: Creating instance...
    hashistack: Loading zone: us-east1-b
    hashistack: Loading machine type: n1-standard-1
    hashistack: Requesting instance creation...
    hashistack: Waiting for creation operation to complete...
    hashistack: Instance has been created!
==> hashistack: Waiting for the instance to become running...
    hashistack: IP: 34.138.153.176
==> hashistack: Using SSH communicator to connect: 34.138.153.176
==> hashistack: Waiting for SSH to become available...
==> hashistack: Connected to SSH!
==> hashistack: Provisioning with shell script: /var/folders/r_/n7lpfkjs17v_qh0y22d4pc640000gn/T/packer-shell2847636162
==> hashistack: Uploading ../shared => /ops
==> hashistack: Uploading ../examples => /ops
==> hashistack: Provisioning with shell script: ../shared/scripts/setup.sh
    hashistack: ==> Mon Apr 24 21:25:21 UTC 2023 - Running /tmp/script_6126.sh
    hashistack: ==> Mon Apr 24 21:25:21 UTC 2023 - Waiting for cloud-init to update /etc/apt/sources.list
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack: waiting ...
    hashistack:   File: /var/lib/cloud/instance/boot-finished
    hashistack:   Size: 69        	Blocks: 8          IO Block: 4096   regular file
    hashistack: Device: 801h/2049d	Inode: 70440       Links: 1
    hashistack: Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
    hashistack: Access: 2023-04-24 21:25:36.881411413 +0000
    hashistack: Modify: 2023-04-24 21:25:36.881411413 +0000
    hashistack: Change: 2023-04-24 21:25:36.881411413 +0000
    hashistack:  Birth: -
    hashistack: Hit:1 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic InRelease
    hashistack: Get:2 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
    hashistack: Get:3 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports InRelease [83.3 kB]
    hashistack: Get:4 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
    hashistack: Get:5 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/universe amd64 Packages [8570 kB]
    hashistack: Get:6 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/universe Translation-en [4941 kB]
    hashistack: Get:7 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/multiverse amd64 Packages [151 kB]
    hashistack: Get:8 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/multiverse Translation-en [108 kB]
    hashistack: Get:9 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [2967 kB]
    hashistack: Get:10 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main Translation-en [542 kB]
    hashistack: Get:11 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [1237 kB]
    hashistack: Get:12 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/restricted Translation-en [172 kB]
    hashistack: Get:13 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [1900 kB]
    hashistack: Get:14 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe Translation-en [416 kB]
    hashistack: Get:15 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/multiverse amd64 Packages [25.6 kB]
    hashistack: Get:16 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/multiverse Translation-en [6088 B]
    hashistack: Get:17 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports/main amd64 Packages [53.3 kB]
    hashistack: Get:18 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports/main Translation-en [14.6 kB]
    hashistack: Get:19 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports/universe amd64 Packages [18.1 kB]
    hashistack: Get:20 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports/universe Translation-en [8668 B]
    hashistack: Get:21 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [2634 kB]
    hashistack: Get:22 http://security.ubuntu.com/ubuntu bionic-security/main Translation-en [455 kB]
    hashistack: Get:23 http://security.ubuntu.com/ubuntu bionic-security/restricted amd64 Packages [1207 kB]
    hashistack: Get:24 http://security.ubuntu.com/ubuntu bionic-security/restricted Translation-en [167 kB]
    hashistack: Get:25 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [1289 kB]
    hashistack: Get:26 http://security.ubuntu.com/ubuntu bionic-security/universe Translation-en [303 kB]
    hashistack: Get:27 http://security.ubuntu.com/ubuntu bionic-security/multiverse amd64 Packages [19.8 kB]
    hashistack: Get:28 http://security.ubuntu.com/ubuntu bionic-security/multiverse Translation-en [3928 B]
    hashistack: Fetched 27.5 MB in 7s (4046 kB/s)
    hashistack: Reading package lists...
    hashistack: Reading package lists...
    hashistack: Building dependency tree...
    hashistack: Reading state information...
    hashistack: lsb-release is already the newest version (9.20170808ubuntu1).
    hashistack: lsb-release set to manually installed.
    hashistack: ca-certificates is already the newest version (20211016ubuntu0.18.04.1).
    hashistack: ca-certificates set to manually installed.
    hashistack: curl is already the newest version (7.58.0-2ubuntu3.24).
    hashistack: curl set to manually installed.
    hashistack: software-properties-common is already the newest version (0.96.24.32.20).
    hashistack: software-properties-common set to manually installed.
    hashistack: sudo is already the newest version (1.8.21p2-3ubuntu1.6).
    hashistack: sudo set to manually installed.
    hashistack: tmux is already the newest version (2.6-3ubuntu0.3).
    hashistack: tmux set to manually installed.
    hashistack: The following package was automatically installed and is no longer required:
    hashistack:   libnuma1
    hashistack: Use 'sudo apt autoremove' to remove it.
    hashistack: Suggested packages:
    hashistack:   ruby-redis zip ctags vim-doc vim-scripts indent
    hashistack: The following NEW packages will be installed:
    hashistack:   apt-transport-https gnupg2 jq libjemalloc1 libjq1 libonig4 redis-tools tree
    hashistack:   unzip
    hashistack: The following packages will be upgraded:
    hashistack:   vim vim-common vim-runtime vim-tiny
    hashistack: 4 upgraded, 9 newly installed, 0 to remove and 4 not upgraded.
    hashistack: Need to get 8238 kB of archives.
    hashistack: After this operation, 4653 kB of additional disk space will be used.
    hashistack: Get:1 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 vim amd64 2:8.0.1453-1ubuntu1.13 [1156 kB]
    hashistack: Get:2 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 vim-tiny amd64 2:8.0.1453-1ubuntu1.13 [479 kB]
    hashistack: Get:3 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 vim-runtime all 2:8.0.1453-1ubuntu1.13 [5439 kB]
    hashistack: Get:4 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 vim-common all 2:8.0.1453-1ubuntu1.13 [73.1 kB]
    hashistack: Get:5 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 apt-transport-https all 1.6.17 [1692 B]
    hashistack: Get:6 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/universe amd64 libonig4 amd64 6.7.0-1 [119 kB]
    hashistack: Get:7 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/universe amd64 libjq1 amd64 1.5+dfsg-2 [111 kB]
    hashistack: Get:8 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/universe amd64 jq amd64 1.5+dfsg-2 [45.6 kB]
    hashistack: Get:9 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/universe amd64 libjemalloc1 amd64 3.6.0-11 [82.4 kB]
    hashistack: Get:10 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 redis-tools amd64 5:4.0.9-1ubuntu0.2 [516 kB]
    hashistack: Get:11 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/universe amd64 tree amd64 1.7.0-5 [40.7 kB]
    hashistack: Get:12 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 unzip amd64 6.0-21ubuntu1.2 [168 kB]
    hashistack: Get:13 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 gnupg2 all 2.2.4-1ubuntu1.6 [5300 B]
    hashistack: Fetched 8238 kB in 1s (7401 kB/s)
    hashistack: (Reading database ... 66706 files and directories currently installed.)
    hashistack: Preparing to unpack .../00-vim_2%3a8.0.1453-1ubuntu1.13_amd64.deb ...
    hashistack: Unpacking vim (2:8.0.1453-1ubuntu1.13) over (2:8.0.1453-1ubuntu1.12) ...
    hashistack: Preparing to unpack .../01-vim-tiny_2%3a8.0.1453-1ubuntu1.13_amd64.deb ...
    hashistack: Unpacking vim-tiny (2:8.0.1453-1ubuntu1.13) over (2:8.0.1453-1ubuntu1.12) ...
    hashistack: Preparing to unpack .../02-vim-runtime_2%3a8.0.1453-1ubuntu1.13_all.deb ...
    hashistack: Unpacking vim-runtime (2:8.0.1453-1ubuntu1.13) over (2:8.0.1453-1ubuntu1.12) ...
    hashistack: Preparing to unpack .../03-vim-common_2%3a8.0.1453-1ubuntu1.13_all.deb ...
    hashistack: Unpacking vim-common (2:8.0.1453-1ubuntu1.13) over (2:8.0.1453-1ubuntu1.12) ...
    hashistack: Selecting previously unselected package apt-transport-https.
    hashistack: Preparing to unpack .../04-apt-transport-https_1.6.17_all.deb ...
    hashistack: Unpacking apt-transport-https (1.6.17) ...
    hashistack: Selecting previously unselected package libonig4:amd64.
    hashistack: Preparing to unpack .../05-libonig4_6.7.0-1_amd64.deb ...
    hashistack: Unpacking libonig4:amd64 (6.7.0-1) ...
    hashistack: Selecting previously unselected package libjq1:amd64.
    hashistack: Preparing to unpack .../06-libjq1_1.5+dfsg-2_amd64.deb ...
    hashistack: Unpacking libjq1:amd64 (1.5+dfsg-2) ...
    hashistack: Selecting previously unselected package jq.
    hashistack: Preparing to unpack .../07-jq_1.5+dfsg-2_amd64.deb ...
    hashistack: Unpacking jq (1.5+dfsg-2) ...
    hashistack: Selecting previously unselected package libjemalloc1.
    hashistack: Preparing to unpack .../08-libjemalloc1_3.6.0-11_amd64.deb ...
    hashistack: Unpacking libjemalloc1 (3.6.0-11) ...
    hashistack: Selecting previously unselected package redis-tools.
    hashistack: Preparing to unpack .../09-redis-tools_5%3a4.0.9-1ubuntu0.2_amd64.deb ...
    hashistack: Unpacking redis-tools (5:4.0.9-1ubuntu0.2) ...
    hashistack: Selecting previously unselected package tree.
    hashistack: Preparing to unpack .../10-tree_1.7.0-5_amd64.deb ...
    hashistack: Unpacking tree (1.7.0-5) ...
    hashistack: Selecting previously unselected package unzip.
    hashistack: Preparing to unpack .../11-unzip_6.0-21ubuntu1.2_amd64.deb ...
    hashistack: Unpacking unzip (6.0-21ubuntu1.2) ...
    hashistack: Selecting previously unselected package gnupg2.
    hashistack: Preparing to unpack .../12-gnupg2_2.2.4-1ubuntu1.6_all.deb ...
    hashistack: Unpacking gnupg2 (2.2.4-1ubuntu1.6) ...
    hashistack: Setting up tree (1.7.0-5) ...
    hashistack: Setting up apt-transport-https (1.6.17) ...
    hashistack: Setting up libjemalloc1 (3.6.0-11) ...
    hashistack: Setting up libonig4:amd64 (6.7.0-1) ...
    hashistack: Setting up unzip (6.0-21ubuntu1.2) ...
    hashistack: Setting up libjq1:amd64 (1.5+dfsg-2) ...
    hashistack: Setting up gnupg2 (2.2.4-1ubuntu1.6) ...
    hashistack: Setting up vim-common (2:8.0.1453-1ubuntu1.13) ...
    hashistack: Setting up vim-runtime (2:8.0.1453-1ubuntu1.13) ...
    hashistack: Setting up vim-tiny (2:8.0.1453-1ubuntu1.13) ...
    hashistack: Setting up jq (1.5+dfsg-2) ...
    hashistack: Setting up redis-tools (5:4.0.9-1ubuntu0.2) ...
    hashistack: Setting up vim (2:8.0.1453-1ubuntu1.13) ...
    hashistack: Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
    hashistack: Processing triggers for mime-support (3.60ubuntu1) ...
    hashistack: Processing triggers for libc-bin (2.27-3ubuntu1.6) ...
    hashistack: ==> Mon Apr 24 21:25:57 UTC 2023 - Installing consul from https://releases.hashicorp.com/consul/1.11.1/consul_1.11.1_linux_amd64.zip
    hashistack: Archive:  /home/ubuntu/consul.zip
    hashistack:   inflating: /usr/local/bin/consul
    hashistack: ==> Mon Apr 24 21:25:58 UTC 2023 - Installing vault from https://releases.hashicorp.com/vault/1.9.2/vault_1.9.2_linux_amd64.zip
    hashistack: Archive:  /home/ubuntu/vault.zip
    hashistack:   inflating: /usr/local/bin/vault
    hashistack: ==> Mon Apr 24 21:26:01 UTC 2023 - Installing nomad from https://releases.hashicorp.com/nomad/1.2.3/nomad_1.2.3_linux_amd64.zip
    hashistack: Archive:  /home/ubuntu/nomad.zip
    hashistack:   inflating: /usr/local/bin/nomad
    hashistack: ==> Mon Apr 24 21:26:03 UTC 2023 - Installing packer from https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_linux_amd64.zip
    hashistack: Archive:  /home/ubuntu/packer.zip
    hashistack:   inflating: /usr/local/bin/packer
    hashistack: ==> Mon Apr 24 21:26:05 UTC 2023 - Installing terraform from https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_amd64.zip
    hashistack: Archive:  /home/ubuntu/terraform.zip
    hashistack:   inflating: /usr/local/bin/terraform
    hashistack: ==> Mon Apr 24 21:26:06 UTC 2023 - Installing consul-template from https://releases.hashicorp.com/consul-template/0.27.2/consul-template_0.27.2_linux_amd64.zip
    hashistack: Archive:  /home/ubuntu/consul-template.zip
    hashistack:   inflating: /usr/local/bin/consul-template
    hashistack: ==> Mon Apr 24 21:26:07 UTC 2023 - Installing envconsul from https://releases.hashicorp.com/envconsul/0.10.0/envconsul_0.10.0_linux_amd64.zip
    hashistack: Archive:  /home/ubuntu/envconsul.zip
    hashistack:   inflating: /usr/local/bin/envconsul
    hashistack: ==> Mon Apr 24 21:26:09 UTC 2023 - Installing sentinel from https://releases.hashicorp.com/sentinel/0.15.6/sentinel_0.15.6_linux_amd64.zip
    hashistack: Archive:  /home/ubuntu/sentinel.zip
    hashistack:   inflating: /usr/local/bin/sentinel
    hashistack: Firewall stopped and disabled on system startup
==> hashistack:   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
==> hashistack:                                  Dload  Upload   Total   Spent    Left  Speed
==> hashistack:   0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
==> hashistack: 100 35.2M  100 35.2M    0     0  66.0M      0 --:--:-- --:--:-- --:--:-- 66.0M
    hashistack: Reading package lists...
    hashistack: Building dependency tree...
    hashistack: Reading state information...
    hashistack: ca-certificates is already the newest version (20211016ubuntu0.18.04.1).
    hashistack: apt-transport-https is already the newest version (1.6.17).
    hashistack: gnupg2 is already the newest version (2.2.4-1ubuntu1.6).
    hashistack: The following package was automatically installed and is no longer required:
    hashistack:   libnuma1
    hashistack: Use 'sudo apt autoremove' to remove it.
    hashistack: 0 upgraded, 0 newly installed, 0 to remove and 4 not upgraded.
==> hashistack: Warning: apt-key output should not be parsed (stdout is not a terminal)
    hashistack: OK
    hashistack: Hit:1 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic InRelease
    hashistack: Hit:2 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates InRelease
    hashistack: Hit:3 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports InRelease
    hashistack: Get:4 https://download.docker.com/linux/ubuntu bionic InRelease [64.4 kB]
    hashistack: Hit:5 http://security.ubuntu.com/ubuntu bionic-security InRelease
    hashistack: Get:6 https://download.docker.com/linux/ubuntu bionic/stable amd64 Packages [36.0 kB]
    hashistack: Fetched 100 kB in 1s (91.2 kB/s)
    hashistack: Reading package lists...
    hashistack: Hit:1 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic InRelease
    hashistack: Hit:2 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates InRelease
    hashistack: Hit:3 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports InRelease
    hashistack: Hit:4 https://download.docker.com/linux/ubuntu bionic InRelease
    hashistack: Hit:5 http://security.ubuntu.com/ubuntu bionic-security InRelease
    hashistack: Reading package lists...
    hashistack: Reading package lists...
    hashistack: Building dependency tree...
    hashistack: Reading state information...
    hashistack: The following package was automatically installed and is no longer required:
    hashistack:   libnuma1
    hashistack: Use 'sudo apt autoremove' to remove it.
    hashistack: The following additional packages will be installed:
    hashistack:   containerd.io docker-buildx-plugin docker-ce-cli docker-ce-rootless-extras
    hashistack:   docker-compose-plugin libltdl7 pigz
    hashistack: Suggested packages:
    hashistack:   aufs-tools cgroupfs-mount | cgroup-lite
    hashistack: Recommended packages:
    hashistack:   slirp4netns
    hashistack: The following NEW packages will be installed:
    hashistack:   containerd.io docker-buildx-plugin docker-ce docker-ce-cli
    hashistack:   docker-ce-rootless-extras docker-compose-plugin libltdl7 pigz
    hashistack: 0 upgraded, 8 newly installed, 0 to remove and 4 not upgraded.
    hashistack: Need to get 109 MB of archives.
    hashistack: After this operation, 395 MB of additional disk space will be used.
    hashistack: Get:1 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/universe amd64 pigz amd64 2.4-1 [57.4 kB]
    hashistack: Get:2 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libltdl7 amd64 2.4.6-2 [38.8 kB]
    hashistack: Get:3 https://download.docker.com/linux/ubuntu bionic/stable amd64 containerd.io amd64 1.6.20-1 [28.3 MB]
    hashistack: Get:4 https://download.docker.com/linux/ubuntu bionic/stable amd64 docker-buildx-plugin amd64 0.10.4-1~ubuntu.18.04~bionic [25.9 MB]
    hashistack: Get:5 https://download.docker.com/linux/ubuntu bionic/stable amd64 docker-ce-cli amd64 5:23.0.4-1~ubuntu.18.04~bionic [13.2 MB]
    hashistack: Get:6 https://download.docker.com/linux/ubuntu bionic/stable amd64 docker-ce amd64 5:23.0.4-1~ubuntu.18.04~bionic [22.0 MB]
    hashistack: Get:7 https://download.docker.com/linux/ubuntu bionic/stable amd64 docker-ce-rootless-extras amd64 5:23.0.4-1~ubuntu.18.04~bionic [8775 kB]
    hashistack: Get:8 https://download.docker.com/linux/ubuntu bionic/stable amd64 docker-compose-plugin amd64 2.17.2-1~ubuntu.18.04~bionic [10.9 MB]
    hashistack: Fetched 109 MB in 3s (42.6 MB/s)
    hashistack: Selecting previously unselected package pigz.
    hashistack: (Reading database ... 66784 files and directories currently installed.)
    hashistack: Preparing to unpack .../0-pigz_2.4-1_amd64.deb ...
    hashistack: Unpacking pigz (2.4-1) ...
    hashistack: Selecting previously unselected package containerd.io.
    hashistack: Preparing to unpack .../1-containerd.io_1.6.20-1_amd64.deb ...
    hashistack: Unpacking containerd.io (1.6.20-1) ...
    hashistack: Selecting previously unselected package docker-buildx-plugin.
    hashistack: Preparing to unpack .../2-docker-buildx-plugin_0.10.4-1~ubuntu.18.04~bionic_amd64.deb ...
    hashistack: Unpacking docker-buildx-plugin (0.10.4-1~ubuntu.18.04~bionic) ...
    hashistack: Selecting previously unselected package docker-ce-cli.
    hashistack: Preparing to unpack .../3-docker-ce-cli_5%3a23.0.4-1~ubuntu.18.04~bionic_amd64.deb ...
    hashistack: Unpacking docker-ce-cli (5:23.0.4-1~ubuntu.18.04~bionic) ...
    hashistack: Selecting previously unselected package docker-ce.
    hashistack: Preparing to unpack .../4-docker-ce_5%3a23.0.4-1~ubuntu.18.04~bionic_amd64.deb ...
    hashistack: Unpacking docker-ce (5:23.0.4-1~ubuntu.18.04~bionic) ...
    hashistack: Selecting previously unselected package docker-ce-rootless-extras.
    hashistack: Preparing to unpack .../5-docker-ce-rootless-extras_5%3a23.0.4-1~ubuntu.18.04~bionic_amd64.deb ...
    hashistack: Unpacking docker-ce-rootless-extras (5:23.0.4-1~ubuntu.18.04~bionic) ...
    hashistack: Selecting previously unselected package docker-compose-plugin.
    hashistack: Preparing to unpack .../6-docker-compose-plugin_2.17.2-1~ubuntu.18.04~bionic_amd64.deb ...
    hashistack: Unpacking docker-compose-plugin (2.17.2-1~ubuntu.18.04~bionic) ...
    hashistack: Selecting previously unselected package libltdl7:amd64.
    hashistack: Preparing to unpack .../7-libltdl7_2.4.6-2_amd64.deb ...
    hashistack: Unpacking libltdl7:amd64 (2.4.6-2) ...
    hashistack: Setting up containerd.io (1.6.20-1) ...
    hashistack: Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
    hashistack: Setting up docker-ce-rootless-extras (5:23.0.4-1~ubuntu.18.04~bionic) ...
    hashistack: Setting up docker-buildx-plugin (0.10.4-1~ubuntu.18.04~bionic) ...
    hashistack: Setting up libltdl7:amd64 (2.4.6-2) ...
    hashistack: Setting up docker-compose-plugin (2.17.2-1~ubuntu.18.04~bionic) ...
    hashistack: Setting up docker-ce-cli (5:23.0.4-1~ubuntu.18.04~bionic) ...
    hashistack: Setting up pigz (2.4-1) ...
    hashistack: Setting up docker-ce (5:23.0.4-1~ubuntu.18.04~bionic) ...
    hashistack: Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /lib/systemd/system/docker.service.
    hashistack: Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /lib/systemd/system/docker.socket.
    hashistack: Processing triggers for libc-bin (2.27-3ubuntu1.6) ...
    hashistack: Processing triggers for systemd (237-3ubuntu10.57) ...
    hashistack: Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
    hashistack: Processing triggers for ureadahead (0.100.0-21) ...
    hashistack: rkt-v1.30.0/
    hashistack: rkt-v1.30.0/manpages/
    hashistack: rkt-v1.30.0/manpages/rkt_completion.1
    hashistack: rkt-v1.30.0/manpages/rkt_run-prepared.1
    hashistack: rkt-v1.30.0/manpages/rkt_image_render.1
    hashistack: rkt-v1.30.0/manpages/rkt_image.1
    hashistack: rkt-v1.30.0/manpages/rkt.1
    hashistack: rkt-v1.30.0/manpages/rkt_image_export.1
    hashistack: rkt-v1.30.0/manpages/rkt_export.1
    hashistack: rkt-v1.30.0/manpages/rkt_prepare.1
    hashistack: rkt-v1.30.0/manpages/rkt_image_rm.1
    hashistack: rkt-v1.30.0/manpages/rkt_metadata-service.1
    hashistack: rkt-v1.30.0/manpages/rkt_list.1
    hashistack: rkt-v1.30.0/manpages/rkt_fetch.1
    hashistack: rkt-v1.30.0/manpages/rkt_version.1
    hashistack: rkt-v1.30.0/manpages/rkt_rm.1
    hashistack: rkt-v1.30.0/manpages/rkt_cat-manifest.1
    hashistack: rkt-v1.30.0/manpages/rkt_config.1
    hashistack: rkt-v1.30.0/manpages/rkt_image_verify.1
    hashistack: rkt-v1.30.0/manpages/rkt_image_list.1
    hashistack: rkt-v1.30.0/manpages/rkt_gc.1
    hashistack: rkt-v1.30.0/manpages/rkt_status.1
    hashistack: rkt-v1.30.0/manpages/rkt_image_extract.1
    hashistack: rkt-v1.30.0/manpages/rkt_image_cat-manifest.1
    hashistack: rkt-v1.30.0/manpages/rkt_trust.1
    hashistack: rkt-v1.30.0/manpages/rkt_image_gc.1
    hashistack: rkt-v1.30.0/manpages/rkt_api-service.1
    hashistack: rkt-v1.30.0/manpages/rkt_enter.1
    hashistack: rkt-v1.30.0/manpages/rkt_run.1
    hashistack: rkt-v1.30.0/manpages/rkt_stop.1
    hashistack: rkt-v1.30.0/init/
    hashistack: rkt-v1.30.0/init/systemd/
    hashistack: rkt-v1.30.0/init/systemd/rkt-metadata.socket
    hashistack: rkt-v1.30.0/init/systemd/rkt-gc.service
    hashistack: rkt-v1.30.0/init/systemd/rkt-api-tcp.socket
    hashistack: rkt-v1.30.0/init/systemd/rkt-gc.timer
    hashistack: rkt-v1.30.0/init/systemd/rkt-api.service
    hashistack: rkt-v1.30.0/init/systemd/rkt-metadata.service
    hashistack: rkt-v1.30.0/init/systemd/tmpfiles.d/
    hashistack: rkt-v1.30.0/init/systemd/tmpfiles.d/rkt.conf
    hashistack: rkt-v1.30.0/stage1-coreos.aci
    hashistack: rkt-v1.30.0/stage1-kvm.aci
    hashistack: rkt-v1.30.0/scripts/
    hashistack: rkt-v1.30.0/scripts/setup-data-dir.sh
    hashistack: rkt-v1.30.0/bash_completion/
    hashistack: rkt-v1.30.0/bash_completion/rkt.bash
    hashistack: rkt-v1.30.0/rkt
    hashistack: rkt-v1.30.0/stage1-fly.aci
    hashistack: Hit:1 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic InRelease
    hashistack: Hit:2 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates InRelease
    hashistack: Hit:3 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports InRelease
    hashistack: Hit:4 https://download.docker.com/linux/ubuntu bionic InRelease
    hashistack: Get:5 http://ppa.launchpad.net/openjdk-r/ppa/ubuntu bionic InRelease [20.8 kB]
    hashistack: Hit:6 http://security.ubuntu.com/ubuntu bionic-security InRelease
    hashistack: Get:7 http://ppa.launchpad.net/openjdk-r/ppa/ubuntu bionic/main amd64 Packages [16.7 kB]
    hashistack: Get:8 http://ppa.launchpad.net/openjdk-r/ppa/ubuntu bionic/main Translation-en [1420 B]
    hashistack: Fetched 38.9 kB in 2s (22.8 kB/s)
    hashistack: Reading package lists...
    hashistack: Hit:1 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic InRelease
    hashistack: Hit:2 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates InRelease
    hashistack: Hit:3 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-backports InRelease
    hashistack: Hit:4 http://security.ubuntu.com/ubuntu bionic-security InRelease
    hashistack: Hit:5 https://download.docker.com/linux/ubuntu bionic InRelease
    hashistack: Hit:6 http://ppa.launchpad.net/openjdk-r/ppa/ubuntu bionic InRelease
    hashistack: Reading package lists...
    hashistack: Reading package lists...
    hashistack: Building dependency tree...
    hashistack: Reading state information...
    hashistack: The following package was automatically installed and is no longer required:
    hashistack:   libnuma1
    hashistack: Use 'sudo apt autoremove' to remove it.
    hashistack: The following additional packages will be installed:
    hashistack:   adwaita-icon-theme at-spi2-core ca-certificates-java fontconfig
    hashistack:   fontconfig-config fonts-dejavu-core fonts-dejavu-extra gtk-update-icon-cache
    hashistack:   hicolor-icon-theme humanity-icon-theme java-common libasound2
    hashistack:   libasound2-data libasyncns0 libatk-bridge2.0-0 libatk-wrapper-java
    hashistack:   libatk-wrapper-java-jni libatk1.0-0 libatk1.0-data libatspi2.0-0
    hashistack:   libavahi-client3 libavahi-common-data libavahi-common3 libcairo2 libcroco3
    hashistack:   libcups2 libdatrie1 libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2
    hashistack:   libdrm-radeon1 libflac8 libfontconfig1 libfontenc1 libgail-common libgail18
    hashistack:   libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgif7
    hashistack:   libgl1 libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libglvnd0 libglx-mesa0
    hashistack:   libglx0 libgraphite2-3 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common
    hashistack:   libharfbuzz0b libice-dev libice6 libjbig0 libjpeg-turbo8 libjpeg8 liblcms2-2
    hashistack:   libllvm10 libogg0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0
    hashistack:   libpciaccess0 libpcsclite1 libpixman-1-0 libpthread-stubs0-dev libpulse0
    hashistack:   librsvg2-2 librsvg2-common libsensors4 libsm-dev libsm6 libsndfile1
    hashistack:   libthai-data libthai0 libtiff5 libvorbis0a libvorbisenc2 libx11-dev
    hashistack:   libx11-doc libx11-xcb1 libxau-dev libxaw7 libxcb-dri2-0 libxcb-dri3-0
    hashistack:   libxcb-glx0 libxcb-present0 libxcb-render0 libxcb-shape0 libxcb-shm0
    hashistack:   libxcb-sync1 libxcb1-dev libxcomposite1 libxcursor1 libxdamage1 libxdmcp-dev
    hashistack:   libxfixes3 libxft2 libxi6 libxinerama1 libxmu6 libxpm4 libxrandr2
    hashistack:   libxrender1 libxshmfence1 libxt-dev libxt6 libxtst6 libxv1 libxxf86dga1
    hashistack:   libxxf86vm1 openjdk-8-jdk-headless openjdk-8-jre openjdk-8-jre-headless
    hashistack:   ubuntu-mono x11-common x11-utils x11proto-core-dev x11proto-dev
    hashistack:   xorg-sgml-doctools xtrans-dev
    hashistack: Suggested packages:
    hashistack:   default-jre libasound2-plugins alsa-utils cups-common gvfs libice-doc
    hashistack:   liblcms2-utils pcscd pulseaudio librsvg2-bin lm-sensors libsm-doc libxcb-doc
    hashistack:   libxt-doc openjdk-8-demo openjdk-8-source visualvm libnss-mdns
    hashistack:   fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei
    hashistack:   fonts-wqy-zenhei fonts-indic mesa-utils
    hashistack: The following NEW packages will be installed:
    hashistack:   adwaita-icon-theme at-spi2-core ca-certificates-java fontconfig
    hashistack:   fontconfig-config fonts-dejavu-core fonts-dejavu-extra gtk-update-icon-cache
    hashistack:   hicolor-icon-theme humanity-icon-theme java-common libasound2
    hashistack:   libasound2-data libasyncns0 libatk-bridge2.0-0 libatk-wrapper-java
    hashistack:   libatk-wrapper-java-jni libatk1.0-0 libatk1.0-data libatspi2.0-0
    hashistack:   libavahi-client3 libavahi-common-data libavahi-common3 libcairo2 libcroco3
    hashistack:   libcups2 libdatrie1 libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2
    hashistack:   libdrm-radeon1 libflac8 libfontconfig1 libfontenc1 libgail-common libgail18
    hashistack:   libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgif7
    hashistack:   libgl1 libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libglvnd0 libglx-mesa0
    hashistack:   libglx0 libgraphite2-3 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common
    hashistack:   libharfbuzz0b libice-dev libice6 libjbig0 libjpeg-turbo8 libjpeg8 liblcms2-2
    hashistack:   libllvm10 libogg0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0
    hashistack:   libpciaccess0 libpcsclite1 libpixman-1-0 libpthread-stubs0-dev libpulse0
    hashistack:   librsvg2-2 librsvg2-common libsensors4 libsm-dev libsm6 libsndfile1
    hashistack:   libthai-data libthai0 libtiff5 libvorbis0a libvorbisenc2 libx11-dev
    hashistack:   libx11-doc libx11-xcb1 libxau-dev libxaw7 libxcb-dri2-0 libxcb-dri3-0
    hashistack:   libxcb-glx0 libxcb-present0 libxcb-render0 libxcb-shape0 libxcb-shm0
    hashistack:   libxcb-sync1 libxcb1-dev libxcomposite1 libxcursor1 libxdamage1 libxdmcp-dev
    hashistack:   libxfixes3 libxft2 libxi6 libxinerama1 libxmu6 libxpm4 libxrandr2
    hashistack:   libxrender1 libxshmfence1 libxt-dev libxt6 libxtst6 libxv1 libxxf86dga1
    hashistack:   libxxf86vm1 openjdk-8-jdk openjdk-8-jdk-headless openjdk-8-jre
    hashistack:   openjdk-8-jre-headless ubuntu-mono x11-common x11-utils x11proto-core-dev
    hashistack:   x11proto-dev xorg-sgml-doctools xtrans-dev
    hashistack: 0 upgraded, 123 newly installed, 0 to remove and 4 not upgraded.
    hashistack: Need to get 84.7 MB of archives.
    hashistack: After this operation, 562 MB of additional disk space will be used.
    hashistack: Get:1 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 fonts-dejavu-core all 2.37-1 [1041 kB]
    hashistack: Get:2 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 fontconfig-config all 2.12.6-0ubuntu2 [55.8 kB]
    hashistack: Get:3 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libfontconfig1 amd64 2.12.6-0ubuntu2 [137 kB]
    hashistack: Get:4 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 fontconfig amd64 2.12.6-0ubuntu2 [169 kB]
    hashistack: Get:5 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libjpeg-turbo8 amd64 1.5.2-0ubuntu5.18.04.6 [111 kB]
    hashistack: Get:6 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libogg0 amd64 1.3.2-1 [17.2 kB]
    hashistack: Get:7 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 x11-common all 1:7.7+19ubuntu7.1 [22.5 kB]
    hashistack: Get:8 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libice6 amd64 2:1.0.9-2ubuntu0.18.04.1 [40.7 kB]
    hashistack: Get:9 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libsm6 amd64 2:1.2.2-1 [15.8 kB]
    hashistack: Get:10 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxrender1 amd64 1:0.9.10-1 [18.7 kB]
    hashistack: Get:11 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxft2 amd64 2.3.2-1 [36.1 kB]
    hashistack: Get:12 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxinerama1 amd64 2:1.1.3-1 [7908 B]
    hashistack: Get:13 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxxf86dga1 amd64 2:1.1.4-1 [13.7 kB]
    hashistack: Get:14 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxxf86vm1 amd64 1:1.1.4-1 [10.6 kB]
    hashistack: Get:15 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 hicolor-icon-theme all 0.17-2 [9976 B]
    hashistack: Get:16 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libjpeg8 amd64 8c-2ubuntu8 [2194 B]
    hashistack: Get:17 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libjbig0 amd64 2.1-3.1ubuntu0.18.04.1 [27.0 kB]
    hashistack: Get:18 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libtiff5 amd64 4.0.9-5ubuntu0.10 [154 kB]
    hashistack: Get:19 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgdk-pixbuf2.0-common all 2.36.11-2 [4536 B]
    hashistack: Get:20 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgdk-pixbuf2.0-0 amd64 2.36.11-2 [165 kB]
    hashistack: Get:21 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 gtk-update-icon-cache amd64 3.22.30-1ubuntu4 [28.3 kB]
    hashistack: Get:22 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libpixman-1-0 amd64 0.34.0-2ubuntu0.1 [229 kB]
    hashistack: Get:23 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb-render0 amd64 1.13-2~ubuntu18.04 [14.7 kB]
    hashistack: Get:24 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb-shm0 amd64 1.13-2~ubuntu18.04 [5600 B]
    hashistack: Get:25 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libcairo2 amd64 1.15.10-2ubuntu0.1 [580 kB]
    hashistack: Get:26 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libcroco3 amd64 0.6.12-2 [81.3 kB]
    hashistack: Get:27 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libthai-data all 0.1.27-2 [133 kB]
    hashistack: Get:28 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libdatrie1 amd64 0.2.10-7 [17.8 kB]
    hashistack: Get:29 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libthai0 amd64 0.1.27-2 [18.0 kB]
    hashistack: Get:30 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libpango-1.0-0 amd64 1.40.14-1ubuntu0.1 [153 kB]
    hashistack: Get:31 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgraphite2-3 amd64 1.3.11-2 [78.7 kB]
    hashistack: Get:32 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libharfbuzz0b amd64 1.7.2-1ubuntu1 [232 kB]
    hashistack: Get:33 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libpangoft2-1.0-0 amd64 1.40.14-1ubuntu0.1 [33.2 kB]
    hashistack: Get:34 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libpangocairo-1.0-0 amd64 1.40.14-1ubuntu0.1 [20.8 kB]
    hashistack: Get:35 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 librsvg2-2 amd64 2.40.20-2ubuntu0.2 [98.6 kB]
    hashistack: Get:36 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 librsvg2-common amd64 2.40.20-2ubuntu0.2 [5064 B]
    hashistack: Get:37 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 humanity-icon-theme all 0.6.15 [1250 kB]
    hashistack: Get:38 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 ubuntu-mono all 16.10+18.04.20181005-0ubuntu1 [149 kB]
    hashistack: Get:39 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 adwaita-icon-theme all 3.28.0-1ubuntu1 [3306 kB]
    hashistack: Get:40 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libatspi2.0-0 amd64 2.28.0-1 [59.6 kB]
    hashistack: Get:41 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxtst6 amd64 2:1.2.3-1 [12.8 kB]
    hashistack: Get:42 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 at-spi2-core amd64 2.28.0-1 [47.9 kB]
    hashistack: Get:43 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 java-common all 0.68ubuntu1~18.04.1 [14.5 kB]
    hashistack: Get:44 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libavahi-common-data amd64 0.7-3.1ubuntu1.3 [22.2 kB]
    hashistack: Get:45 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libavahi-common3 amd64 0.7-3.1ubuntu1.3 [21.6 kB]
    hashistack: Get:46 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libavahi-client3 amd64 0.7-3.1ubuntu1.3 [25.2 kB]
    hashistack: Get:47 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libcups2 amd64 2.2.7-1ubuntu2.9 [211 kB]
    hashistack: Get:48 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 liblcms2-2 amd64 2.9-1ubuntu0.1 [139 kB]
    hashistack: Get:49 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libpcsclite1 amd64 1.8.23-1 [21.3 kB]
    hashistack: Get:50 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxi6 amd64 2:1.7.9-1 [29.2 kB]
    hashistack: Get:51 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 openjdk-8-jre-headless amd64 8u362-ga-0ubuntu1~18.04.1 [28.3 MB]
    hashistack: Get:52 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 ca-certificates-java all 20180516ubuntu1~18.04.1 [12.2 kB]
    hashistack: Get:53 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 fonts-dejavu-extra all 2.37-1 [1953 kB]
    hashistack: Get:54 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libasound2-data all 1.1.3-5ubuntu0.6 [38.5 kB]
    hashistack: Get:55 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libasound2 amd64 1.1.3-5ubuntu0.6 [360 kB]
    hashistack: Get:56 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libasyncns0 amd64 0.8-6 [12.1 kB]
    hashistack: Get:57 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libatk1.0-data all 2.28.1-1 [2992 B]
    hashistack: Get:58 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libatk1.0-0 amd64 2.28.1-1 [43.9 kB]
    hashistack: Get:59 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libatk-bridge2.0-0 amd64 2.26.2-1 [57.3 kB]
    hashistack: Get:60 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libfontenc1 amd64 1:1.1.3-1 [13.9 kB]
    hashistack: Get:61 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libglvnd0 amd64 1.0.0-2ubuntu2.3 [47.0 kB]
    hashistack: Get:62 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libglapi-mesa amd64 20.0.8-0ubuntu1~18.04.1 [26.6 kB]
    hashistack: Get:63 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libx11-xcb1 amd64 2:1.6.4-3ubuntu0.4 [9720 B]
    hashistack: Get:64 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb-dri2-0 amd64 1.13-2~ubuntu18.04 [6920 B]
    hashistack: Get:65 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb-dri3-0 amd64 1.13-2~ubuntu18.04 [6568 B]
    hashistack: Get:66 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb-glx0 amd64 1.13-2~ubuntu18.04 [22.1 kB]
    hashistack: Get:67 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb-present0 amd64 1.13-2~ubuntu18.04 [5552 B]
    hashistack: Get:68 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb-sync1 amd64 1.13-2~ubuntu18.04 [8808 B]
    hashistack: Get:69 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxdamage1 amd64 1:1.1.4-3 [6934 B]
    hashistack: Get:70 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxfixes3 amd64 1:5.0.3-1 [10.8 kB]
    hashistack: Get:71 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxshmfence1 amd64 1.3-1 [5028 B]
    hashistack: Get:72 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libdrm-amdgpu1 amd64 2.4.101-2~18.04.1 [18.2 kB]
    hashistack: Get:73 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libpciaccess0 amd64 0.14-1 [17.9 kB]
    hashistack: Get:74 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libdrm-intel1 amd64 2.4.101-2~18.04.1 [60.0 kB]
    hashistack: Get:75 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libdrm-nouveau2 amd64 2.4.101-2~18.04.1 [16.5 kB]
    hashistack: Get:76 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libdrm-radeon1 amd64 2.4.101-2~18.04.1 [21.7 kB]
    hashistack: Get:77 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libllvm10 amd64 1:10.0.0-4ubuntu1~18.04.2 [15.4 MB]
    hashistack: Get:78 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libsensors4 amd64 1:3.4.0-4ubuntu0.1 [28.3 kB]
    hashistack: Get:79 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libgl1-mesa-dri amd64 20.0.8-0ubuntu1~18.04.1 [9333 kB]
    hashistack: Get:80 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libglx-mesa0 amd64 20.0.8-0ubuntu1~18.04.1 [139 kB]
    hashistack: Get:81 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libglx0 amd64 1.0.0-2ubuntu2.3 [28.1 kB]
    hashistack: Get:82 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libgl1 amd64 1.0.0-2ubuntu2.3 [86.2 kB]
    hashistack: Get:83 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libgl1-mesa-glx amd64 20.0.8-0ubuntu1~18.04.1 [5532 B]
    hashistack: Get:84 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxt6 amd64 1:1.1.5-1 [160 kB]
    hashistack: Get:85 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxmu6 amd64 2:1.1.2-2 [46.0 kB]
    hashistack: Get:86 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxpm4 amd64 1:3.5.12-1ubuntu0.18.04.2 [34.8 kB]
    hashistack: Get:87 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxaw7 amd64 2:1.0.13-1 [173 kB]
    hashistack: Get:88 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb-shape0 amd64 1.13-2~ubuntu18.04 [5972 B]
    hashistack: Get:89 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxcomposite1 amd64 1:0.4.4-2 [6988 B]
    hashistack: Get:90 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxrandr2 amd64 2:1.5.1-1 [18.1 kB]
    hashistack: Get:91 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxv1 amd64 2:1.0.11-1 [10.7 kB]
    hashistack: Get:92 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 x11-utils amd64 7.7+3build1 [196 kB]
    hashistack: Get:93 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libatk-wrapper-java all 0.33.3-20ubuntu0.1 [34.7 kB]
    hashistack: Get:94 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libatk-wrapper-java-jni amd64 0.33.3-20ubuntu0.1 [28.3 kB]
    hashistack: Get:95 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libflac8 amd64 1.3.2-1ubuntu0.1 [213 kB]
    hashistack: Get:96 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgtk2.0-common all 2.24.32-1ubuntu1 [125 kB]
    hashistack: Get:97 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxcursor1 amd64 1:1.1.15-1 [19.8 kB]
    hashistack: Get:98 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgtk2.0-0 amd64 2.24.32-1ubuntu1 [1769 kB]
    hashistack: Get:99 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgail18 amd64 2.24.32-1ubuntu1 [14.2 kB]
    hashistack: Get:100 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgail-common amd64 2.24.32-1ubuntu1 [112 kB]
    hashistack: Get:101 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgdk-pixbuf2.0-bin amd64 2.36.11-2 [7864 B]
    hashistack: Get:102 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libgif7 amd64 5.1.4-2ubuntu0.1 [30.9 kB]
    hashistack: Get:103 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libgtk2.0-bin amd64 2.24.32-1ubuntu1 [7536 B]
    hashistack: Get:104 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 xorg-sgml-doctools all 1:1.11-1 [12.9 kB]
    hashistack: Get:105 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 x11proto-dev all 2018.4-4 [251 kB]
    hashistack: Get:106 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 x11proto-core-dev all 2018.4-4 [2620 B]
    hashistack: Get:107 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libice-dev amd64 2:1.0.9-2ubuntu0.18.04.1 [47.2 kB]
    hashistack: Get:108 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libpthread-stubs0-dev amd64 0.3-4 [4068 B]
    hashistack: Get:109 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libvorbis0a amd64 1.3.5-4.2 [86.4 kB]
    hashistack: Get:110 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libvorbisenc2 amd64 1.3.5-4.2 [70.7 kB]
    hashistack: Get:111 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libsndfile1 amd64 1.0.28-4ubuntu0.18.04.2 [170 kB]
    hashistack: Get:112 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libpulse0 amd64 1:11.1-1ubuntu7.11 [266 kB]
    hashistack: Get:113 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libsm-dev amd64 2:1.2.2-1 [16.2 kB]
    hashistack: Get:114 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxau-dev amd64 1:1.0.8-1ubuntu1 [9476 B]
    hashistack: Get:115 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxdmcp-dev amd64 1:1.1.2-3 [25.1 kB]
    hashistack: Get:116 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 xtrans-dev all 1.3.5-1 [70.5 kB]
    hashistack: Get:117 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxcb1-dev amd64 1.13-2~ubuntu18.04 [80.0 kB]
    hashistack: Get:118 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libx11-dev amd64 2:1.6.4-3ubuntu0.4 [641 kB]
    hashistack: Get:119 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libx11-doc all 2:1.6.4-3ubuntu0.4 [2065 kB]
    hashistack: Get:120 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic/main amd64 libxt-dev amd64 1:1.1.5-1 [395 kB]
    hashistack: Get:121 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 openjdk-8-jre amd64 8u362-ga-0ubuntu1~18.04.1 [69.8 kB]
    hashistack: Get:122 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 openjdk-8-jdk-headless amd64 8u362-ga-0ubuntu1~18.04.1 [8286 kB]
    hashistack: Get:123 http://us-east1.gce.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 openjdk-8-jdk amd64 8u362-ga-0ubuntu1~18.04.1 [3996 kB]
    hashistack: Fetched 84.7 MB in 3s (26.3 MB/s)
    hashistack: Selecting previously unselected package fonts-dejavu-core.
    hashistack: (Reading database ... 67041 files and directories currently installed.)
    hashistack: Preparing to unpack .../000-fonts-dejavu-core_2.37-1_all.deb ...
    hashistack: Unpacking fonts-dejavu-core (2.37-1) ...
    hashistack: Selecting previously unselected package fontconfig-config.
    hashistack: Preparing to unpack .../001-fontconfig-config_2.12.6-0ubuntu2_all.deb ...
    hashistack: Unpacking fontconfig-config (2.12.6-0ubuntu2) ...
    hashistack: Selecting previously unselected package libfontconfig1:amd64.
    hashistack: Preparing to unpack .../002-libfontconfig1_2.12.6-0ubuntu2_amd64.deb ...
    hashistack: Unpacking libfontconfig1:amd64 (2.12.6-0ubuntu2) ...
    hashistack: Selecting previously unselected package fontconfig.
    hashistack: Preparing to unpack .../003-fontconfig_2.12.6-0ubuntu2_amd64.deb ...
    hashistack: Unpacking fontconfig (2.12.6-0ubuntu2) ...
    hashistack: Selecting previously unselected package libjpeg-turbo8:amd64.
    hashistack: Preparing to unpack .../004-libjpeg-turbo8_1.5.2-0ubuntu5.18.04.6_amd64.deb ...
    hashistack: Unpacking libjpeg-turbo8:amd64 (1.5.2-0ubuntu5.18.04.6) ...
    hashistack: Selecting previously unselected package libogg0:amd64.
    hashistack: Preparing to unpack .../005-libogg0_1.3.2-1_amd64.deb ...
    hashistack: Unpacking libogg0:amd64 (1.3.2-1) ...
    hashistack: Selecting previously unselected package x11-common.
    hashistack: Preparing to unpack .../006-x11-common_1%3a7.7+19ubuntu7.1_all.deb ...
    hashistack: dpkg-query: no packages found matching nux-tools
    hashistack: Unpacking x11-common (1:7.7+19ubuntu7.1) ...
    hashistack: Selecting previously unselected package libice6:amd64.
    hashistack: Preparing to unpack .../007-libice6_2%3a1.0.9-2ubuntu0.18.04.1_amd64.deb ...
    hashistack: Unpacking libice6:amd64 (2:1.0.9-2ubuntu0.18.04.1) ...
    hashistack: Selecting previously unselected package libsm6:amd64.
    hashistack: Preparing to unpack .../008-libsm6_2%3a1.2.2-1_amd64.deb ...
    hashistack: Unpacking libsm6:amd64 (2:1.2.2-1) ...
    hashistack: Selecting previously unselected package libxrender1:amd64.
    hashistack: Preparing to unpack .../009-libxrender1_1%3a0.9.10-1_amd64.deb ...
    hashistack: Unpacking libxrender1:amd64 (1:0.9.10-1) ...
    hashistack: Selecting previously unselected package libxft2:amd64.
    hashistack: Preparing to unpack .../010-libxft2_2.3.2-1_amd64.deb ...
    hashistack: Unpacking libxft2:amd64 (2.3.2-1) ...
    hashistack: Selecting previously unselected package libxinerama1:amd64.
    hashistack: Preparing to unpack .../011-libxinerama1_2%3a1.1.3-1_amd64.deb ...
    hashistack: Unpacking libxinerama1:amd64 (2:1.1.3-1) ...
    hashistack: Selecting previously unselected package libxxf86dga1:amd64.
    hashistack: Preparing to unpack .../012-libxxf86dga1_2%3a1.1.4-1_amd64.deb ...
    hashistack: Unpacking libxxf86dga1:amd64 (2:1.1.4-1) ...
    hashistack: Selecting previously unselected package libxxf86vm1:amd64.
    hashistack: Preparing to unpack .../013-libxxf86vm1_1%3a1.1.4-1_amd64.deb ...
    hashistack: Unpacking libxxf86vm1:amd64 (1:1.1.4-1) ...
    hashistack: Selecting previously unselected package hicolor-icon-theme.
    hashistack: Preparing to unpack .../014-hicolor-icon-theme_0.17-2_all.deb ...
    hashistack: Unpacking hicolor-icon-theme (0.17-2) ...
    hashistack: Selecting previously unselected package libjpeg8:amd64.
    hashistack: Preparing to unpack .../015-libjpeg8_8c-2ubuntu8_amd64.deb ...
    hashistack: Unpacking libjpeg8:amd64 (8c-2ubuntu8) ...
    hashistack: Selecting previously unselected package libjbig0:amd64.
    hashistack: Preparing to unpack .../016-libjbig0_2.1-3.1ubuntu0.18.04.1_amd64.deb ...
    hashistack: Unpacking libjbig0:amd64 (2.1-3.1ubuntu0.18.04.1) ...
    hashistack: Selecting previously unselected package libtiff5:amd64.
    hashistack: Preparing to unpack .../017-libtiff5_4.0.9-5ubuntu0.10_amd64.deb ...
    hashistack: Unpacking libtiff5:amd64 (4.0.9-5ubuntu0.10) ...
    hashistack: Selecting previously unselected package libgdk-pixbuf2.0-common.
    hashistack: Preparing to unpack .../018-libgdk-pixbuf2.0-common_2.36.11-2_all.deb ...
    hashistack: Unpacking libgdk-pixbuf2.0-common (2.36.11-2) ...
    hashistack: Selecting previously unselected package libgdk-pixbuf2.0-0:amd64.
    hashistack: Preparing to unpack .../019-libgdk-pixbuf2.0-0_2.36.11-2_amd64.deb ...
    hashistack: Unpacking libgdk-pixbuf2.0-0:amd64 (2.36.11-2) ...
    hashistack: Selecting previously unselected package gtk-update-icon-cache.
    hashistack: Preparing to unpack .../020-gtk-update-icon-cache_3.22.30-1ubuntu4_amd64.deb ...
    hashistack: No diversion 'diversion of /usr/sbin/update-icon-caches to /usr/sbin/update-icon-caches.gtk2 by libgtk-3-bin', none removed.
    hashistack: No diversion 'diversion of /usr/share/man/man8/update-icon-caches.8.gz to /usr/share/man/man8/update-icon-caches.gtk2.8.gz by libgtk-3-bin', none removed.
    hashistack: Unpacking gtk-update-icon-cache (3.22.30-1ubuntu4) ...
    hashistack: Selecting previously unselected package libpixman-1-0:amd64.
    hashistack: Preparing to unpack .../021-libpixman-1-0_0.34.0-2ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libpixman-1-0:amd64 (0.34.0-2ubuntu0.1) ...
    hashistack: Selecting previously unselected package libxcb-render0:amd64.
    hashistack: Preparing to unpack .../022-libxcb-render0_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb-render0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libxcb-shm0:amd64.
    hashistack: Preparing to unpack .../023-libxcb-shm0_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb-shm0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libcairo2:amd64.
    hashistack: Preparing to unpack .../024-libcairo2_1.15.10-2ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libcairo2:amd64 (1.15.10-2ubuntu0.1) ...
    hashistack: Selecting previously unselected package libcroco3:amd64.
    hashistack: Preparing to unpack .../025-libcroco3_0.6.12-2_amd64.deb ...
    hashistack: Unpacking libcroco3:amd64 (0.6.12-2) ...
    hashistack: Selecting previously unselected package libthai-data.
    hashistack: Preparing to unpack .../026-libthai-data_0.1.27-2_all.deb ...
    hashistack: Unpacking libthai-data (0.1.27-2) ...
    hashistack: Selecting previously unselected package libdatrie1:amd64.
    hashistack: Preparing to unpack .../027-libdatrie1_0.2.10-7_amd64.deb ...
    hashistack: Unpacking libdatrie1:amd64 (0.2.10-7) ...
    hashistack: Selecting previously unselected package libthai0:amd64.
    hashistack: Preparing to unpack .../028-libthai0_0.1.27-2_amd64.deb ...
    hashistack: Unpacking libthai0:amd64 (0.1.27-2) ...
    hashistack: Selecting previously unselected package libpango-1.0-0:amd64.
    hashistack: Preparing to unpack .../029-libpango-1.0-0_1.40.14-1ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libpango-1.0-0:amd64 (1.40.14-1ubuntu0.1) ...
    hashistack: Selecting previously unselected package libgraphite2-3:amd64.
    hashistack: Preparing to unpack .../030-libgraphite2-3_1.3.11-2_amd64.deb ...
    hashistack: Unpacking libgraphite2-3:amd64 (1.3.11-2) ...
    hashistack: Selecting previously unselected package libharfbuzz0b:amd64.
    hashistack: Preparing to unpack .../031-libharfbuzz0b_1.7.2-1ubuntu1_amd64.deb ...
    hashistack: Unpacking libharfbuzz0b:amd64 (1.7.2-1ubuntu1) ...
    hashistack: Selecting previously unselected package libpangoft2-1.0-0:amd64.
    hashistack: Preparing to unpack .../032-libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libpangoft2-1.0-0:amd64 (1.40.14-1ubuntu0.1) ...
    hashistack: Selecting previously unselected package libpangocairo-1.0-0:amd64.
    hashistack: Preparing to unpack .../033-libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libpangocairo-1.0-0:amd64 (1.40.14-1ubuntu0.1) ...
    hashistack: Selecting previously unselected package librsvg2-2:amd64.
    hashistack: Preparing to unpack .../034-librsvg2-2_2.40.20-2ubuntu0.2_amd64.deb ...
    hashistack: Unpacking librsvg2-2:amd64 (2.40.20-2ubuntu0.2) ...
    hashistack: Selecting previously unselected package librsvg2-common:amd64.
    hashistack: Preparing to unpack .../035-librsvg2-common_2.40.20-2ubuntu0.2_amd64.deb ...
    hashistack: Unpacking librsvg2-common:amd64 (2.40.20-2ubuntu0.2) ...
    hashistack: Selecting previously unselected package humanity-icon-theme.
    hashistack: Preparing to unpack .../036-humanity-icon-theme_0.6.15_all.deb ...
    hashistack: Unpacking humanity-icon-theme (0.6.15) ...
    hashistack: Selecting previously unselected package ubuntu-mono.
    hashistack: Preparing to unpack .../037-ubuntu-mono_16.10+18.04.20181005-0ubuntu1_all.deb ...
    hashistack: Unpacking ubuntu-mono (16.10+18.04.20181005-0ubuntu1) ...
    hashistack: Selecting previously unselected package adwaita-icon-theme.
    hashistack: Preparing to unpack .../038-adwaita-icon-theme_3.28.0-1ubuntu1_all.deb ...
    hashistack: Unpacking adwaita-icon-theme (3.28.0-1ubuntu1) ...
    hashistack: Selecting previously unselected package libatspi2.0-0:amd64.
    hashistack: Preparing to unpack .../039-libatspi2.0-0_2.28.0-1_amd64.deb ...
    hashistack: Unpacking libatspi2.0-0:amd64 (2.28.0-1) ...
    hashistack: Selecting previously unselected package libxtst6:amd64.
    hashistack: Preparing to unpack .../040-libxtst6_2%3a1.2.3-1_amd64.deb ...
    hashistack: Unpacking libxtst6:amd64 (2:1.2.3-1) ...
    hashistack: Selecting previously unselected package at-spi2-core.
    hashistack: Preparing to unpack .../041-at-spi2-core_2.28.0-1_amd64.deb ...
    hashistack: Unpacking at-spi2-core (2.28.0-1) ...
    hashistack: Selecting previously unselected package java-common.
    hashistack: Preparing to unpack .../042-java-common_0.68ubuntu1~18.04.1_all.deb ...
    hashistack: Unpacking java-common (0.68ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package libavahi-common-data:amd64.
    hashistack: Preparing to unpack .../043-libavahi-common-data_0.7-3.1ubuntu1.3_amd64.deb ...
    hashistack: Unpacking libavahi-common-data:amd64 (0.7-3.1ubuntu1.3) ...
    hashistack: Selecting previously unselected package libavahi-common3:amd64.
    hashistack: Preparing to unpack .../044-libavahi-common3_0.7-3.1ubuntu1.3_amd64.deb ...
    hashistack: Unpacking libavahi-common3:amd64 (0.7-3.1ubuntu1.3) ...
    hashistack: Selecting previously unselected package libavahi-client3:amd64.
    hashistack: Preparing to unpack .../045-libavahi-client3_0.7-3.1ubuntu1.3_amd64.deb ...
    hashistack: Unpacking libavahi-client3:amd64 (0.7-3.1ubuntu1.3) ...
    hashistack: Selecting previously unselected package libcups2:amd64.
    hashistack: Preparing to unpack .../046-libcups2_2.2.7-1ubuntu2.9_amd64.deb ...
    hashistack: Unpacking libcups2:amd64 (2.2.7-1ubuntu2.9) ...
    hashistack: Selecting previously unselected package liblcms2-2:amd64.
    hashistack: Preparing to unpack .../047-liblcms2-2_2.9-1ubuntu0.1_amd64.deb ...
    hashistack: Unpacking liblcms2-2:amd64 (2.9-1ubuntu0.1) ...
    hashistack: Selecting previously unselected package libpcsclite1:amd64.
    hashistack: Preparing to unpack .../048-libpcsclite1_1.8.23-1_amd64.deb ...
    hashistack: Unpacking libpcsclite1:amd64 (1.8.23-1) ...
    hashistack: Selecting previously unselected package libxi6:amd64.
    hashistack: Preparing to unpack .../049-libxi6_2%3a1.7.9-1_amd64.deb ...
    hashistack: Unpacking libxi6:amd64 (2:1.7.9-1) ...
    hashistack: Selecting previously unselected package openjdk-8-jre-headless:amd64.
    hashistack: Preparing to unpack .../050-openjdk-8-jre-headless_8u362-ga-0ubuntu1~18.04.1_amd64.deb ...
    hashistack: Unpacking openjdk-8-jre-headless:amd64 (8u362-ga-0ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package ca-certificates-java.
    hashistack: Preparing to unpack .../051-ca-certificates-java_20180516ubuntu1~18.04.1_all.deb ...
    hashistack: Unpacking ca-certificates-java (20180516ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package fonts-dejavu-extra.
    hashistack: Preparing to unpack .../052-fonts-dejavu-extra_2.37-1_all.deb ...
    hashistack: Unpacking fonts-dejavu-extra (2.37-1) ...
    hashistack: Selecting previously unselected package libasound2-data.
    hashistack: Preparing to unpack .../053-libasound2-data_1.1.3-5ubuntu0.6_all.deb ...
    hashistack: Unpacking libasound2-data (1.1.3-5ubuntu0.6) ...
    hashistack: Selecting previously unselected package libasound2:amd64.
    hashistack: Preparing to unpack .../054-libasound2_1.1.3-5ubuntu0.6_amd64.deb ...
    hashistack: Unpacking libasound2:amd64 (1.1.3-5ubuntu0.6) ...
    hashistack: Selecting previously unselected package libasyncns0:amd64.
    hashistack: Preparing to unpack .../055-libasyncns0_0.8-6_amd64.deb ...
    hashistack: Unpacking libasyncns0:amd64 (0.8-6) ...
    hashistack: Selecting previously unselected package libatk1.0-data.
    hashistack: Preparing to unpack .../056-libatk1.0-data_2.28.1-1_all.deb ...
    hashistack: Unpacking libatk1.0-data (2.28.1-1) ...
    hashistack: Selecting previously unselected package libatk1.0-0:amd64.
    hashistack: Preparing to unpack .../057-libatk1.0-0_2.28.1-1_amd64.deb ...
    hashistack: Unpacking libatk1.0-0:amd64 (2.28.1-1) ...
    hashistack: Selecting previously unselected package libatk-bridge2.0-0:amd64.
    hashistack: Preparing to unpack .../058-libatk-bridge2.0-0_2.26.2-1_amd64.deb ...
    hashistack: Unpacking libatk-bridge2.0-0:amd64 (2.26.2-1) ...
    hashistack: Selecting previously unselected package libfontenc1:amd64.
    hashistack: Preparing to unpack .../059-libfontenc1_1%3a1.1.3-1_amd64.deb ...
    hashistack: Unpacking libfontenc1:amd64 (1:1.1.3-1) ...
    hashistack: Selecting previously unselected package libglvnd0:amd64.
    hashistack: Preparing to unpack .../060-libglvnd0_1.0.0-2ubuntu2.3_amd64.deb ...
    hashistack: Unpacking libglvnd0:amd64 (1.0.0-2ubuntu2.3) ...
    hashistack: Selecting previously unselected package libglapi-mesa:amd64.
    hashistack: Preparing to unpack .../061-libglapi-mesa_20.0.8-0ubuntu1~18.04.1_amd64.deb ...
    hashistack: Unpacking libglapi-mesa:amd64 (20.0.8-0ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package libx11-xcb1:amd64.
    hashistack: Preparing to unpack .../062-libx11-xcb1_2%3a1.6.4-3ubuntu0.4_amd64.deb ...
    hashistack: Unpacking libx11-xcb1:amd64 (2:1.6.4-3ubuntu0.4) ...
    hashistack: Selecting previously unselected package libxcb-dri2-0:amd64.
    hashistack: Preparing to unpack .../063-libxcb-dri2-0_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb-dri2-0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libxcb-dri3-0:amd64.
    hashistack: Preparing to unpack .../064-libxcb-dri3-0_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb-dri3-0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libxcb-glx0:amd64.
    hashistack: Preparing to unpack .../065-libxcb-glx0_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb-glx0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libxcb-present0:amd64.
    hashistack: Preparing to unpack .../066-libxcb-present0_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb-present0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libxcb-sync1:amd64.
    hashistack: Preparing to unpack .../067-libxcb-sync1_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb-sync1:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libxdamage1:amd64.
    hashistack: Preparing to unpack .../068-libxdamage1_1%3a1.1.4-3_amd64.deb ...
    hashistack: Unpacking libxdamage1:amd64 (1:1.1.4-3) ...
    hashistack: Selecting previously unselected package libxfixes3:amd64.
    hashistack: Preparing to unpack .../069-libxfixes3_1%3a5.0.3-1_amd64.deb ...
    hashistack: Unpacking libxfixes3:amd64 (1:5.0.3-1) ...
    hashistack: Selecting previously unselected package libxshmfence1:amd64.
    hashistack: Preparing to unpack .../070-libxshmfence1_1.3-1_amd64.deb ...
    hashistack: Unpacking libxshmfence1:amd64 (1.3-1) ...
    hashistack: Selecting previously unselected package libdrm-amdgpu1:amd64.
    hashistack: Preparing to unpack .../071-libdrm-amdgpu1_2.4.101-2~18.04.1_amd64.deb ...
    hashistack: Unpacking libdrm-amdgpu1:amd64 (2.4.101-2~18.04.1) ...
    hashistack: Selecting previously unselected package libpciaccess0:amd64.
    hashistack: Preparing to unpack .../072-libpciaccess0_0.14-1_amd64.deb ...
    hashistack: Unpacking libpciaccess0:amd64 (0.14-1) ...
    hashistack: Selecting previously unselected package libdrm-intel1:amd64.
    hashistack: Preparing to unpack .../073-libdrm-intel1_2.4.101-2~18.04.1_amd64.deb ...
    hashistack: Unpacking libdrm-intel1:amd64 (2.4.101-2~18.04.1) ...
    hashistack: Selecting previously unselected package libdrm-nouveau2:amd64.
    hashistack: Preparing to unpack .../074-libdrm-nouveau2_2.4.101-2~18.04.1_amd64.deb ...
    hashistack: Unpacking libdrm-nouveau2:amd64 (2.4.101-2~18.04.1) ...
    hashistack: Selecting previously unselected package libdrm-radeon1:amd64.
    hashistack: Preparing to unpack .../075-libdrm-radeon1_2.4.101-2~18.04.1_amd64.deb ...
    hashistack: Unpacking libdrm-radeon1:amd64 (2.4.101-2~18.04.1) ...
    hashistack: Selecting previously unselected package libllvm10:amd64.
    hashistack: Preparing to unpack .../076-libllvm10_1%3a10.0.0-4ubuntu1~18.04.2_amd64.deb ...
    hashistack: Unpacking libllvm10:amd64 (1:10.0.0-4ubuntu1~18.04.2) ...
    hashistack: Selecting previously unselected package libsensors4:amd64.
    hashistack: Preparing to unpack .../077-libsensors4_1%3a3.4.0-4ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libsensors4:amd64 (1:3.4.0-4ubuntu0.1) ...
    hashistack: Selecting previously unselected package libgl1-mesa-dri:amd64.
    hashistack: Preparing to unpack .../078-libgl1-mesa-dri_20.0.8-0ubuntu1~18.04.1_amd64.deb ...
    hashistack: Unpacking libgl1-mesa-dri:amd64 (20.0.8-0ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package libglx-mesa0:amd64.
    hashistack: Preparing to unpack .../079-libglx-mesa0_20.0.8-0ubuntu1~18.04.1_amd64.deb ...
    hashistack: Unpacking libglx-mesa0:amd64 (20.0.8-0ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package libglx0:amd64.
    hashistack: Preparing to unpack .../080-libglx0_1.0.0-2ubuntu2.3_amd64.deb ...
    hashistack: Unpacking libglx0:amd64 (1.0.0-2ubuntu2.3) ...
    hashistack: Selecting previously unselected package libgl1:amd64.
    hashistack: Preparing to unpack .../081-libgl1_1.0.0-2ubuntu2.3_amd64.deb ...
    hashistack: Unpacking libgl1:amd64 (1.0.0-2ubuntu2.3) ...
    hashistack: Selecting previously unselected package libgl1-mesa-glx:amd64.
    hashistack: Preparing to unpack .../082-libgl1-mesa-glx_20.0.8-0ubuntu1~18.04.1_amd64.deb ...
    hashistack: Unpacking libgl1-mesa-glx:amd64 (20.0.8-0ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package libxt6:amd64.
    hashistack: Preparing to unpack .../083-libxt6_1%3a1.1.5-1_amd64.deb ...
    hashistack: Unpacking libxt6:amd64 (1:1.1.5-1) ...
    hashistack: Selecting previously unselected package libxmu6:amd64.
    hashistack: Preparing to unpack .../084-libxmu6_2%3a1.1.2-2_amd64.deb ...
    hashistack: Unpacking libxmu6:amd64 (2:1.1.2-2) ...
    hashistack: Selecting previously unselected package libxpm4:amd64.
    hashistack: Preparing to unpack .../085-libxpm4_1%3a3.5.12-1ubuntu0.18.04.2_amd64.deb ...
    hashistack: Unpacking libxpm4:amd64 (1:3.5.12-1ubuntu0.18.04.2) ...
    hashistack: Selecting previously unselected package libxaw7:amd64.
    hashistack: Preparing to unpack .../086-libxaw7_2%3a1.0.13-1_amd64.deb ...
    hashistack: Unpacking libxaw7:amd64 (2:1.0.13-1) ...
    hashistack: Selecting previously unselected package libxcb-shape0:amd64.
    hashistack: Preparing to unpack .../087-libxcb-shape0_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb-shape0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libxcomposite1:amd64.
    hashistack: Preparing to unpack .../088-libxcomposite1_1%3a0.4.4-2_amd64.deb ...
    hashistack: Unpacking libxcomposite1:amd64 (1:0.4.4-2) ...
    hashistack: Selecting previously unselected package libxrandr2:amd64.
    hashistack: Preparing to unpack .../089-libxrandr2_2%3a1.5.1-1_amd64.deb ...
    hashistack: Unpacking libxrandr2:amd64 (2:1.5.1-1) ...
    hashistack: Selecting previously unselected package libxv1:amd64.
    hashistack: Preparing to unpack .../090-libxv1_2%3a1.0.11-1_amd64.deb ...
    hashistack: Unpacking libxv1:amd64 (2:1.0.11-1) ...
    hashistack: Selecting previously unselected package x11-utils.
    hashistack: Preparing to unpack .../091-x11-utils_7.7+3build1_amd64.deb ...
    hashistack: Unpacking x11-utils (7.7+3build1) ...
    hashistack: Selecting previously unselected package libatk-wrapper-java.
    hashistack: Preparing to unpack .../092-libatk-wrapper-java_0.33.3-20ubuntu0.1_all.deb ...
    hashistack: Unpacking libatk-wrapper-java (0.33.3-20ubuntu0.1) ...
    hashistack: Selecting previously unselected package libatk-wrapper-java-jni:amd64.
    hashistack: Preparing to unpack .../093-libatk-wrapper-java-jni_0.33.3-20ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libatk-wrapper-java-jni:amd64 (0.33.3-20ubuntu0.1) ...
    hashistack: Selecting previously unselected package libflac8:amd64.
    hashistack: Preparing to unpack .../094-libflac8_1.3.2-1ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libflac8:amd64 (1.3.2-1ubuntu0.1) ...
    hashistack: Selecting previously unselected package libgtk2.0-common.
    hashistack: Preparing to unpack .../095-libgtk2.0-common_2.24.32-1ubuntu1_all.deb ...
    hashistack: Unpacking libgtk2.0-common (2.24.32-1ubuntu1) ...
    hashistack: Selecting previously unselected package libxcursor1:amd64.
    hashistack: Preparing to unpack .../096-libxcursor1_1%3a1.1.15-1_amd64.deb ...
    hashistack: Unpacking libxcursor1:amd64 (1:1.1.15-1) ...
    hashistack: Selecting previously unselected package libgtk2.0-0:amd64.
    hashistack: Preparing to unpack .../097-libgtk2.0-0_2.24.32-1ubuntu1_amd64.deb ...
    hashistack: Unpacking libgtk2.0-0:amd64 (2.24.32-1ubuntu1) ...
    hashistack: Selecting previously unselected package libgail18:amd64.
    hashistack: Preparing to unpack .../098-libgail18_2.24.32-1ubuntu1_amd64.deb ...
    hashistack: Unpacking libgail18:amd64 (2.24.32-1ubuntu1) ...
    hashistack: Selecting previously unselected package libgail-common:amd64.
    hashistack: Preparing to unpack .../099-libgail-common_2.24.32-1ubuntu1_amd64.deb ...
    hashistack: Unpacking libgail-common:amd64 (2.24.32-1ubuntu1) ...
    hashistack: Selecting previously unselected package libgdk-pixbuf2.0-bin.
    hashistack: Preparing to unpack .../100-libgdk-pixbuf2.0-bin_2.36.11-2_amd64.deb ...
    hashistack: Unpacking libgdk-pixbuf2.0-bin (2.36.11-2) ...
    hashistack: Selecting previously unselected package libgif7:amd64.
    hashistack: Preparing to unpack .../101-libgif7_5.1.4-2ubuntu0.1_amd64.deb ...
    hashistack: Unpacking libgif7:amd64 (5.1.4-2ubuntu0.1) ...
    hashistack: Selecting previously unselected package libgtk2.0-bin.
    hashistack: Preparing to unpack .../102-libgtk2.0-bin_2.24.32-1ubuntu1_amd64.deb ...
    hashistack: Unpacking libgtk2.0-bin (2.24.32-1ubuntu1) ...
    hashistack: Selecting previously unselected package xorg-sgml-doctools.
    hashistack: Preparing to unpack .../103-xorg-sgml-doctools_1%3a1.11-1_all.deb ...
    hashistack: Unpacking xorg-sgml-doctools (1:1.11-1) ...
    hashistack: Selecting previously unselected package x11proto-dev.
    hashistack: Preparing to unpack .../104-x11proto-dev_2018.4-4_all.deb ...
    hashistack: Unpacking x11proto-dev (2018.4-4) ...
    hashistack: Selecting previously unselected package x11proto-core-dev.
    hashistack: Preparing to unpack .../105-x11proto-core-dev_2018.4-4_all.deb ...
    hashistack: Unpacking x11proto-core-dev (2018.4-4) ...
    hashistack: Selecting previously unselected package libice-dev:amd64.
    hashistack: Preparing to unpack .../106-libice-dev_2%3a1.0.9-2ubuntu0.18.04.1_amd64.deb ...
    hashistack: Unpacking libice-dev:amd64 (2:1.0.9-2ubuntu0.18.04.1) ...
    hashistack: Selecting previously unselected package libpthread-stubs0-dev:amd64.
    hashistack: Preparing to unpack .../107-libpthread-stubs0-dev_0.3-4_amd64.deb ...
    hashistack: Unpacking libpthread-stubs0-dev:amd64 (0.3-4) ...
    hashistack: Selecting previously unselected package libvorbis0a:amd64.
    hashistack: Preparing to unpack .../108-libvorbis0a_1.3.5-4.2_amd64.deb ...
    hashistack: Unpacking libvorbis0a:amd64 (1.3.5-4.2) ...
    hashistack: Selecting previously unselected package libvorbisenc2:amd64.
    hashistack: Preparing to unpack .../109-libvorbisenc2_1.3.5-4.2_amd64.deb ...
    hashistack: Unpacking libvorbisenc2:amd64 (1.3.5-4.2) ...
    hashistack: Selecting previously unselected package libsndfile1:amd64.
    hashistack: Preparing to unpack .../110-libsndfile1_1.0.28-4ubuntu0.18.04.2_amd64.deb ...
    hashistack: Unpacking libsndfile1:amd64 (1.0.28-4ubuntu0.18.04.2) ...
    hashistack: Selecting previously unselected package libpulse0:amd64.
    hashistack: Preparing to unpack .../111-libpulse0_1%3a11.1-1ubuntu7.11_amd64.deb ...
    hashistack: Unpacking libpulse0:amd64 (1:11.1-1ubuntu7.11) ...
    hashistack: Selecting previously unselected package libsm-dev:amd64.
    hashistack: Preparing to unpack .../112-libsm-dev_2%3a1.2.2-1_amd64.deb ...
    hashistack: Unpacking libsm-dev:amd64 (2:1.2.2-1) ...
    hashistack: Selecting previously unselected package libxau-dev:amd64.
    hashistack: Preparing to unpack .../113-libxau-dev_1%3a1.0.8-1ubuntu1_amd64.deb ...
    hashistack: Unpacking libxau-dev:amd64 (1:1.0.8-1ubuntu1) ...
    hashistack: Selecting previously unselected package libxdmcp-dev:amd64.
    hashistack: Preparing to unpack .../114-libxdmcp-dev_1%3a1.1.2-3_amd64.deb ...
    hashistack: Unpacking libxdmcp-dev:amd64 (1:1.1.2-3) ...
    hashistack: Selecting previously unselected package xtrans-dev.
    hashistack: Preparing to unpack .../115-xtrans-dev_1.3.5-1_all.deb ...
    hashistack: Unpacking xtrans-dev (1.3.5-1) ...
    hashistack: Selecting previously unselected package libxcb1-dev:amd64.
    hashistack: Preparing to unpack .../116-libxcb1-dev_1.13-2~ubuntu18.04_amd64.deb ...
    hashistack: Unpacking libxcb1-dev:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Selecting previously unselected package libx11-dev:amd64.
    hashistack: Preparing to unpack .../117-libx11-dev_2%3a1.6.4-3ubuntu0.4_amd64.deb ...
    hashistack: Unpacking libx11-dev:amd64 (2:1.6.4-3ubuntu0.4) ...
    hashistack: Selecting previously unselected package libx11-doc.
    hashistack: Preparing to unpack .../118-libx11-doc_2%3a1.6.4-3ubuntu0.4_all.deb ...
    hashistack: Unpacking libx11-doc (2:1.6.4-3ubuntu0.4) ...
    hashistack: Selecting previously unselected package libxt-dev:amd64.
    hashistack: Preparing to unpack .../119-libxt-dev_1%3a1.1.5-1_amd64.deb ...
    hashistack: Unpacking libxt-dev:amd64 (1:1.1.5-1) ...
    hashistack: Selecting previously unselected package openjdk-8-jre:amd64.
    hashistack: Preparing to unpack .../120-openjdk-8-jre_8u362-ga-0ubuntu1~18.04.1_amd64.deb ...
    hashistack: Unpacking openjdk-8-jre:amd64 (8u362-ga-0ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package openjdk-8-jdk-headless:amd64.
    hashistack: Preparing to unpack .../121-openjdk-8-jdk-headless_8u362-ga-0ubuntu1~18.04.1_amd64.deb ...
    hashistack: Unpacking openjdk-8-jdk-headless:amd64 (8u362-ga-0ubuntu1~18.04.1) ...
    hashistack: Selecting previously unselected package openjdk-8-jdk:amd64.
    hashistack: Preparing to unpack .../122-openjdk-8-jdk_8u362-ga-0ubuntu1~18.04.1_amd64.deb ...
    hashistack: Unpacking openjdk-8-jdk:amd64 (8u362-ga-0ubuntu1~18.04.1) ...
    hashistack: Setting up libxi6:amd64 (2:1.7.9-1) ...
    hashistack: Setting up libxcb-present0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libglvnd0:amd64 (1.0.0-2ubuntu2.3) ...
    hashistack: Setting up libxinerama1:amd64 (2:1.1.3-1) ...
    hashistack: Setting up libxcb-dri2-0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libxcb-dri3-0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libxcb-glx0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libgtk2.0-common (2.24.32-1ubuntu1) ...
    hashistack: Setting up libxcb-render0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libllvm10:amd64 (1:10.0.0-4ubuntu1~18.04.2) ...
    hashistack: Setting up libasyncns0:amd64 (0.8-6) ...
    hashistack: Setting up libxdamage1:amd64 (1:1.1.4-3) ...
    hashistack: Setting up libxfixes3:amd64 (1:5.0.3-1) ...
    hashistack: Setting up libdrm-amdgpu1:amd64 (2.4.101-2~18.04.1) ...
    hashistack: Setting up liblcms2-2:amd64 (2.9-1ubuntu0.1) ...
    hashistack: Setting up libjbig0:amd64 (2.1-3.1ubuntu0.18.04.1) ...
    hashistack: Setting up libpcsclite1:amd64 (1.8.23-1) ...
    hashistack: Setting up libpthread-stubs0-dev:amd64 (0.3-4) ...
    hashistack: Setting up fonts-dejavu-core (2.37-1) ...
    hashistack: Setting up libatspi2.0-0:amd64 (2.28.0-1) ...
    hashistack: Setting up libasound2-data (1.1.3-5ubuntu0.6) ...
    hashistack: Setting up libxshmfence1:amd64 (1.3-1) ...
    hashistack: Setting up xorg-sgml-doctools (1:1.11-1) ...
    hashistack: Setting up java-common (0.68ubuntu1~18.04.1) ...
    hashistack: Setting up libgdk-pixbuf2.0-common (2.36.11-2) ...
    hashistack: Setting up libdatrie1:amd64 (0.2.10-7) ...
    hashistack: Setting up libgif7:amd64 (5.1.4-2ubuntu0.1) ...
    hashistack: Setting up libjpeg-turbo8:amd64 (1.5.2-0ubuntu5.18.04.6) ...
    hashistack: Setting up libglapi-mesa:amd64 (20.0.8-0ubuntu1~18.04.1) ...
    hashistack: Setting up x11proto-dev (2018.4-4) ...
    hashistack: Setting up libasound2:amd64 (1.1.3-5ubuntu0.6) ...
    hashistack: Setting up libgraphite2-3:amd64 (1.3.11-2) ...
    hashistack: Setting up libcroco3:amd64 (0.6.12-2) ...
    hashistack: Setting up libxcb-sync1:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libogg0:amd64 (1.3.2-1) ...
    hashistack: Setting up libatk1.0-data (2.28.1-1) ...
    hashistack: Setting up libx11-xcb1:amd64 (2:1.6.4-3ubuntu0.4) ...
    hashistack: Setting up libpixman-1-0:amd64 (0.34.0-2ubuntu0.1) ...
    hashistack: Setting up xtrans-dev (1.3.5-1) ...
    hashistack: Setting up libxdmcp-dev:amd64 (1:1.1.2-3) ...
    hashistack: Setting up libxxf86dga1:amd64 (2:1.1.4-1) ...
    hashistack: Setting up libatk1.0-0:amd64 (2.28.1-1) ...
    hashistack: Setting up libatk-bridge2.0-0:amd64 (2.26.2-1) ...
    hashistack: Setting up libfontenc1:amd64 (1:1.1.3-1) ...
    hashistack: Setting up libxcomposite1:amd64 (1:0.4.4-2) ...
    hashistack: Setting up libxcb-shm0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libxpm4:amd64 (1:3.5.12-1ubuntu0.18.04.2) ...
    hashistack: Setting up libx11-doc (2:1.6.4-3ubuntu0.4) ...
    hashistack: Setting up libxcb-shape0:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libpciaccess0:amd64 (0.14-1) ...
    hashistack: Setting up libxrender1:amd64 (1:0.9.10-1) ...
    hashistack: Setting up libxv1:amd64 (2:1.0.11-1) ...
    hashistack: Setting up libsensors4:amd64 (1:3.4.0-4ubuntu0.1) ...
    hashistack: Setting up libdrm-radeon1:amd64 (2.4.101-2~18.04.1) ...
    hashistack: Setting up libthai-data (0.1.27-2) ...
    hashistack: Setting up libxxf86vm1:amd64 (1:1.1.4-1) ...
    hashistack: Setting up libdrm-nouveau2:amd64 (2.4.101-2~18.04.1) ...
    hashistack: Setting up fonts-dejavu-extra (2.37-1) ...
    hashistack: Setting up libvorbis0a:amd64 (1.3.5-4.2) ...
    hashistack: Setting up x11-common (1:7.7+19ubuntu7.1) ...
    hashistack: update-rc.d: warning: start and stop actions are no longer supported; falling back to defaults
    hashistack: Setting up hicolor-icon-theme (0.17-2) ...
    hashistack: Setting up libxrandr2:amd64 (2:1.5.1-1) ...
    hashistack: Setting up libavahi-common-data:amd64 (0.7-3.1ubuntu1.3) ...
    hashistack: Setting up libjpeg8:amd64 (8c-2ubuntu8) ...
    hashistack: Setting up fontconfig-config (2.12.6-0ubuntu2) ...
    hashistack: Setting up x11proto-core-dev (2018.4-4) ...
    hashistack: Setting up libflac8:amd64 (1.3.2-1ubuntu0.1) ...
    hashistack: Setting up libharfbuzz0b:amd64 (1.7.2-1ubuntu1) ...
    hashistack: Setting up libtiff5:amd64 (4.0.9-5ubuntu0.10) ...
    hashistack: Setting up libxau-dev:amd64 (1:1.0.8-1ubuntu1) ...
    hashistack: Setting up libthai0:amd64 (0.1.27-2) ...
    hashistack: Setting up libxtst6:amd64 (2:1.2.3-1) ...
    hashistack: Setting up libdrm-intel1:amd64 (2.4.101-2~18.04.1) ...
    hashistack: Setting up libxcursor1:amd64 (1:1.1.15-1) ...
    hashistack: Setting up libice6:amd64 (2:1.0.9-2ubuntu0.18.04.1) ...
    hashistack: Setting up libxcb1-dev:amd64 (1.13-2~ubuntu18.04) ...
    hashistack: Setting up libavahi-common3:amd64 (0.7-3.1ubuntu1.3) ...
    hashistack: Setting up libx11-dev:amd64 (2:1.6.4-3ubuntu0.4) ...
    hashistack: Setting up libvorbisenc2:amd64 (1.3.5-4.2) ...
    hashistack: Setting up libfontconfig1:amd64 (2.12.6-0ubuntu2) ...
    hashistack: Setting up libsm6:amd64 (2:1.2.2-1) ...
    hashistack: Setting up at-spi2-core (2.28.0-1) ...
    hashistack: Setting up libgdk-pixbuf2.0-0:amd64 (2.36.11-2) ...
    hashistack: Setting up libgl1-mesa-dri:amd64 (20.0.8-0ubuntu1~18.04.1) ...
    hashistack: Setting up libgdk-pixbuf2.0-bin (2.36.11-2) ...
    hashistack: Setting up libsndfile1:amd64 (1.0.28-4ubuntu0.18.04.2) ...
    hashistack: Setting up gtk-update-icon-cache (3.22.30-1ubuntu4) ...
    hashistack: Setting up libice-dev:amd64 (2:1.0.9-2ubuntu0.18.04.1) ...
    hashistack: Setting up libxt6:amd64 (1:1.1.5-1) ...
    hashistack: Setting up libavahi-client3:amd64 (0.7-3.1ubuntu1.3) ...
    hashistack: Setting up libxft2:amd64 (2.3.2-1) ...
    hashistack: Setting up fontconfig (2.12.6-0ubuntu2) ...
    hashistack: Regenerating fonts cache... done.
    hashistack: Setting up libglx-mesa0:amd64 (20.0.8-0ubuntu1~18.04.1) ...
    hashistack: Setting up libcups2:amd64 (2.2.7-1ubuntu2.9) ...
    hashistack: Setting up libcairo2:amd64 (1.15.10-2ubuntu0.1) ...
    hashistack: Setting up libsm-dev:amd64 (2:1.2.2-1) ...
    hashistack: Setting up libpulse0:amd64 (1:11.1-1ubuntu7.11) ...
    hashistack: Setting up libxmu6:amd64 (2:1.1.2-2) ...
    hashistack: Setting up libpango-1.0-0:amd64 (1.40.14-1ubuntu0.1) ...
    hashistack: Setting up libglx0:amd64 (1.0.0-2ubuntu2.3) ...
    hashistack: Setting up libxaw7:amd64 (2:1.0.13-1) ...
    hashistack: Setting up libxt-dev:amd64 (1:1.1.5-1) ...
    hashistack: Setting up libpangoft2-1.0-0:amd64 (1.40.14-1ubuntu0.1) ...
    hashistack: Setting up libgl1:amd64 (1.0.0-2ubuntu2.3) ...
    hashistack: Setting up x11-utils (7.7+3build1) ...
    hashistack: Setting up libpangocairo-1.0-0:amd64 (1.40.14-1ubuntu0.1) ...
    hashistack: Setting up libgl1-mesa-glx:amd64 (20.0.8-0ubuntu1~18.04.1) ...
    hashistack: Setting up libatk-wrapper-java (0.33.3-20ubuntu0.1) ...
    hashistack: Setting up librsvg2-2:amd64 (2.40.20-2ubuntu0.2) ...
    hashistack: Setting up librsvg2-common:amd64 (2.40.20-2ubuntu0.2) ...
    hashistack: Setting up libatk-wrapper-java-jni:amd64 (0.33.3-20ubuntu0.1) ...
    hashistack: Setting up adwaita-icon-theme (3.28.0-1ubuntu1) ...
    hashistack: update-alternatives: using /usr/share/icons/Adwaita/cursor.theme to provide /usr/share/icons/default/index.theme (x-cursor-theme) in auto mode
    hashistack: Setting up libgtk2.0-0:amd64 (2.24.32-1ubuntu1) ...
    hashistack: Setting up ca-certificates-java (20180516ubuntu1~18.04.1) ...
    hashistack: head: cannot open '/etc/ssl/certs/java/cacerts' for reading: No such file or directory
    hashistack: Adding debian:SwissSign_Gold_CA_-_G2.pem
    hashistack: Adding debian:TUBITAK_Kamu_SM_SSL_Kok_Sertifikasi_-_Surum_1.pem
    hashistack: Adding debian:TeliaSonera_Root_CA_v1.pem
    hashistack: Adding debian:T-TeleSec_GlobalRoot_Class_3.pem
    hashistack: Adding debian:GlobalSign_Root_CA_-_R6.pem
    hashistack: Adding debian:SSL.com_EV_Root_Certification_Authority_ECC.pem
    hashistack: Adding debian:Security_Communication_RootCA2.pem
    hashistack: Adding debian:QuoVadis_Root_CA_3.pem
    hashistack: Adding debian:GTS_Root_R2.pem
    hashistack: Adding debian:Starfield_Services_Root_Certificate_Authority_-_G2.pem
    hashistack: Adding debian:E-Tugra_Certification_Authority.pem
    hashistack: Adding debian:ACCVRAIZ1.pem
    hashistack: Adding debian:D-TRUST_Root_Class_3_CA_2_2009.pem
    hashistack: Adding debian:certSIGN_Root_CA_G2.pem
    hashistack: Adding debian:Amazon_Root_CA_3.pem
    hashistack: Adding debian:AffirmTrust_Premium_ECC.pem
    hashistack: Adding debian:NetLock_Arany_=Class_Gold=_Főtanúsítvány.pem
    hashistack: Adding debian:CFCA_EV_ROOT.pem
    hashistack: Adding debian:GTS_Root_R4.pem
    hashistack: Adding debian:Hongkong_Post_Root_CA_3.pem
    hashistack: Adding debian:DigiCert_Global_Root_CA.pem
    hashistack: Adding debian:T-TeleSec_GlobalRoot_Class_2.pem
    hashistack: Adding debian:USERTrust_RSA_Certification_Authority.pem
    hashistack: Adding debian:DigiCert_Global_Root_G2.pem
    hashistack: Adding debian:Microsoft_RSA_Root_Certificate_Authority_2017.pem
    hashistack: Adding debian:Staat_der_Nederlanden_EV_Root_CA.pem
    hashistack: Adding debian:Certum_Trusted_Network_CA.pem
    hashistack: Adding debian:Microsec_e-Szigno_Root_CA_2009.pem
    hashistack: Adding debian:Secure_Global_CA.pem
    hashistack: Adding debian:IdenTrust_Public_Sector_Root_CA_1.pem
    hashistack: Adding debian:CA_Disig_Root_R2.pem
    hashistack: Adding debian:GlobalSign_Root_CA_-_R3.pem
    hashistack: Adding debian:OISTE_WISeKey_Global_Root_GC_CA.pem
    hashistack: Adding debian:Amazon_Root_CA_2.pem
    hashistack: Adding debian:DigiCert_Assured_ID_Root_G3.pem
    hashistack: Adding debian:D-TRUST_Root_Class_3_CA_2_EV_2009.pem
    hashistack: Adding debian:Hellenic_Academic_and_Research_Institutions_ECC_RootCA_2015.pem
    hashistack: Adding debian:Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
    hashistack: Adding debian:OISTE_WISeKey_Global_Root_GB_CA.pem
    hashistack: Adding debian:GlobalSign_ECC_Root_CA_-_R4.pem
    hashistack: Adding debian:Izenpe.com.pem
    hashistack: Adding debian:Entrust_Root_Certification_Authority_-_EC1.pem
    hashistack: Adding debian:TWCA_Root_Certification_Authority.pem
    hashistack: Adding debian:ePKI_Root_Certification_Authority.pem
    hashistack: Adding debian:Certum_Trusted_Network_CA_2.pem
    hashistack: Adding debian:AC_RAIZ_FNMT-RCM.pem
    hashistack: Adding debian:SecureTrust_CA.pem
    hashistack: Adding debian:Starfield_Class_2_CA.pem
    hashistack: Adding debian:AffirmTrust_Networking.pem
    hashistack: Adding debian:Trustwave_Global_ECC_P256_Certification_Authority.pem
    hashistack: Adding debian:emSign_Root_CA_-_G1.pem
    hashistack: Adding debian:certSIGN_ROOT_CA.pem
    hashistack: Adding debian:emSign_Root_CA_-_C1.pem
    hashistack: Adding debian:SSL.com_EV_Root_Certification_Authority_RSA_R2.pem
    hashistack: Adding debian:COMODO_RSA_Certification_Authority.pem
    hashistack: Adding debian:QuoVadis_Root_CA_2_G3.pem
    hashistack: Adding debian:EC-ACC.pem
    hashistack: Adding debian:USERTrust_ECC_Certification_Authority.pem
    hashistack: Adding debian:Microsoft_ECC_Root_Certificate_Authority_2017.pem
    hashistack: Adding debian:Atos_TrustedRoot_2011.pem
    hashistack: Adding debian:GlobalSign_Root_R46.pem
    hashistack: Adding debian:AffirmTrust_Premium.pem
    hashistack: Adding debian:Security_Communication_Root_CA.pem
    hashistack: Adding debian:Trustwave_Global_ECC_P384_Certification_Authority.pem
    hashistack: Adding debian:Cybertrust_Global_Root.pem
    hashistack: Adding debian:Starfield_Root_Certificate_Authority_-_G2.pem
    hashistack: Adding debian:UCA_Global_G2_Root.pem
    hashistack: Adding debian:Buypass_Class_3_Root_CA.pem
    hashistack: Adding debian:emSign_ECC_Root_CA_-_G3.pem
    hashistack: Adding debian:QuoVadis_Root_CA_3_G3.pem
    hashistack: Adding debian:Certum_Trusted_Root_CA.pem
    hashistack: Adding debian:AffirmTrust_Commercial.pem
    hashistack: Adding debian:Actalis_Authentication_Root_CA.pem
    hashistack: Adding debian:SSL.com_Root_Certification_Authority_RSA.pem
    hashistack: Adding debian:GLOBALTRUST_2020.pem
    hashistack: Adding debian:Trustwave_Global_Certification_Authority.pem
    hashistack: Adding debian:GlobalSign_Root_CA.pem
    hashistack: Adding debian:TWCA_Global_Root_CA.pem
    hashistack: Adding debian:e-Szigno_Root_CA_2017.pem
    hashistack: Adding debian:Go_Daddy_Class_2_CA.pem
    hashistack: Adding debian:GDCA_TrustAUTH_R5_ROOT.pem
    hashistack: Adding debian:UCA_Extended_Validation_Root.pem
    hashistack: Adding debian:Certigna_Root_CA.pem
    hashistack: Adding debian:ISRG_Root_X1.pem
    hashistack: Adding debian:Entrust_Root_Certification_Authority.pem
    hashistack: Adding debian:Comodo_AAA_Services_root.pem
    hashistack: Adding debian:Buypass_Class_2_Root_CA.pem
    hashistack: Adding debian:DigiCert_High_Assurance_EV_Root_CA.pem
    hashistack: Adding debian:GTS_Root_R3.pem
    hashistack: Adding debian:XRamp_Global_CA_Root.pem
    hashistack: Adding debian:QuoVadis_Root_CA_2.pem
    hashistack: Adding debian:Certigna.pem
    hashistack: Adding debian:GlobalSign_ECC_Root_CA_-_R5.pem
    hashistack: Adding debian:GlobalSign_Root_E46.pem
    hashistack: Adding debian:AC_RAIZ_FNMT-RCM_SERVIDORES_SEGUROS.pem
    hashistack: Adding debian:Hongkong_Post_Root_CA_1.pem
    hashistack: Adding debian:emSign_ECC_Root_CA_-_C3.pem
    hashistack: Adding debian:DigiCert_Trusted_Root_G4.pem
    hashistack: Adding debian:SSL.com_Root_Certification_Authority_ECC.pem
    hashistack: Adding debian:SZAFIR_ROOT_CA2.pem
    hashistack: Adding debian:GlobalSign_Root_CA_-_R2.pem
    hashistack: Adding debian:Network_Solutions_Certificate_Authority.pem
    hashistack: Adding debian:Entrust.net_Premium_2048_Secure_Server_CA.pem
    hashistack: Adding debian:DigiCert_Global_Root_G3.pem
    hashistack: Adding debian:Hellenic_Academic_and_Research_Institutions_RootCA_2015.pem
    hashistack: Adding debian:SecureSign_RootCA11.pem
    hashistack: Adding debian:Amazon_Root_CA_1.pem
    hashistack: Adding debian:SwissSign_Silver_CA_-_G2.pem
    hashistack: Adding debian:Amazon_Root_CA_4.pem
    hashistack: Adding debian:ANF_Secure_Server_Root_CA.pem
    hashistack: Adding debian:Go_Daddy_Root_Certificate_Authority_-_G2.pem
    hashistack: Adding debian:COMODO_ECC_Certification_Authority.pem
    hashistack: Adding debian:Hellenic_Academic_and_Research_Institutions_RootCA_2011.pem
    hashistack: Adding debian:GTS_Root_R1.pem
    hashistack: Adding debian:Certum_EC-384_CA.pem
    hashistack: Adding debian:Entrust_Root_Certification_Authority_-_G2.pem
    hashistack: Adding debian:COMODO_Certification_Authority.pem
    hashistack: Adding debian:IdenTrust_Commercial_Root_CA_1.pem
    hashistack: Adding debian:QuoVadis_Root_CA_1_G3.pem
    hashistack: Adding debian:NAVER_Global_Root_Certification_Authority.pem
    hashistack: Adding debian:DigiCert_Assured_ID_Root_CA.pem
    hashistack: Adding debian:DigiCert_Assured_ID_Root_G2.pem
    hashistack: Adding debian:Baltimore_CyberTrust_Root.pem
    hashistack: Adding debian:Entrust_Root_Certification_Authority_-_G4.pem
    hashistack: done.
    hashistack: Setting up libgail18:amd64 (2.24.32-1ubuntu1) ...
    hashistack: Setting up libgail-common:amd64 (2.24.32-1ubuntu1) ...
    hashistack: Setting up humanity-icon-theme (0.6.15) ...
    hashistack: Setting up libgtk2.0-bin (2.24.32-1ubuntu1) ...
    hashistack: Setting up ubuntu-mono (16.10+18.04.20181005-0ubuntu1) ...
    hashistack: Processing triggers for libc-bin (2.27-3ubuntu1.6) ...
    hashistack: Processing triggers for systemd (237-3ubuntu10.57) ...
    hashistack: Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
    hashistack: Processing triggers for ca-certificates (20211016ubuntu0.18.04.1) ...
    hashistack: Updating certificates in /etc/ssl/certs...
    hashistack: 0 added, 0 removed; done.
    hashistack: Running hooks in /etc/ca-certificates/update.d...
    hashistack:
    hashistack: done.
    hashistack: done.
    hashistack: Setting up openjdk-8-jre-headless:amd64 (8u362-ga-0ubuntu1~18.04.1) ...
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/rmid to provide /usr/bin/rmid (rmid) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java to provide /usr/bin/java (java) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/keytool to provide /usr/bin/keytool (keytool) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/jjs to provide /usr/bin/jjs (jjs) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/pack200 to provide /usr/bin/pack200 (pack200) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/rmiregistry to provide /usr/bin/rmiregistry (rmiregistry) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/unpack200 to provide /usr/bin/unpack200 (unpack200) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/orbd to provide /usr/bin/orbd (orbd) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/servertool to provide /usr/bin/servertool (servertool) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/tnameserv to provide /usr/bin/tnameserv (tnameserv) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/jexec to provide /usr/bin/jexec (jexec) in auto mode
    hashistack: Processing triggers for mime-support (3.60ubuntu1) ...
    hashistack: Processing triggers for ureadahead (0.100.0-21) ...
    hashistack: Setting up openjdk-8-jdk-headless:amd64 (8u362-ga-0ubuntu1~18.04.1) ...
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/idlj to provide /usr/bin/idlj (idlj) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jdeps to provide /usr/bin/jdeps (jdeps) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/wsimport to provide /usr/bin/wsimport (wsimport) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/rmic to provide /usr/bin/rmic (rmic) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jinfo to provide /usr/bin/jinfo (jinfo) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jsadebugd to provide /usr/bin/jsadebugd (jsadebugd) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/native2ascii to provide /usr/bin/native2ascii (native2ascii) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jstat to provide /usr/bin/jstat (jstat) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/javadoc to provide /usr/bin/javadoc (javadoc) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/javah to provide /usr/bin/javah (javah) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/hsdb to provide /usr/bin/hsdb (hsdb) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/clhsdb to provide /usr/bin/clhsdb (clhsdb) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jstack to provide /usr/bin/jstack (jstack) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jrunscript to provide /usr/bin/jrunscript (jrunscript) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/javac to provide /usr/bin/javac (javac) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/javap to provide /usr/bin/javap (javap) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jar to provide /usr/bin/jar (jar) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/xjc to provide /usr/bin/xjc (xjc) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/schemagen to provide /usr/bin/schemagen (schemagen) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jps to provide /usr/bin/jps (jps) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/extcheck to provide /usr/bin/extcheck (extcheck) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jarsigner to provide /usr/bin/jarsigner (jarsigner) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jmap to provide /usr/bin/jmap (jmap) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jstatd to provide /usr/bin/jstatd (jstatd) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jhat to provide /usr/bin/jhat (jhat) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jdb to provide /usr/bin/jdb (jdb) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/serialver to provide /usr/bin/serialver (serialver) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jfr to provide /usr/bin/jfr (jfr) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/wsgen to provide /usr/bin/wsgen (wsgen) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jcmd to provide /usr/bin/jcmd (jcmd) in auto mode
    hashistack: Setting up openjdk-8-jre:amd64 (8u362-ga-0ubuntu1~18.04.1) ...
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/policytool to provide /usr/bin/policytool (policytool) in auto mode
    hashistack: Setting up openjdk-8-jdk:amd64 (8u362-ga-0ubuntu1~18.04.1) ...
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/appletviewer to provide /usr/bin/appletviewer (appletviewer) in auto mode
    hashistack: update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/bin/jconsole to provide /usr/bin/jconsole (jconsole) in auto mode
    hashistack: Processing triggers for libgdk-pixbuf2.0-0:amd64 (2.36.11-2) ...
    hashistack: Processing triggers for libc-bin (2.27-3ubuntu1.6) ...
==> hashistack: Deleting instance...
    hashistack: Instance has been deleted!
==> hashistack: Creating image...
==> hashistack: Deleting disk...
    hashistack: Disk has been deleted!
Build 'hashistack' finished after 5 minutes 13 seconds.

==> Wait completed after 5 minutes 13 seconds

==> Builds finished. The artifacts of successful builds are:
--> hashistack: A disk image was created: hashistack
```

```
➜  gcp git:(main) cd env/us-east
```

```
➜  us-east git:(main) terraform init
Initializing modules...
- hashistack in ../../modules/hashistack
- hashistack-csi in ../../modules/hashistack-csi

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/google from the dependency lock file
- Reusing previous version of hashicorp/local from the dependency lock file
- Installing hashicorp/google v4.5.0...
- Installed hashicorp/google v4.5.0 (signed by HashiCorp)
- Installing hashicorp/local v2.1.0...
- Installed hashicorp/local v2.1.0 (signed by HashiCorp)

Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```
➜  us-east git:(main) ✗ terraform plan -var="project=${GOOGLE_PROJECT}" -var="credentials=${GOOGLE_APPLICATION_CREDENTIALS}"
module.hashistack-csi.data.google_compute_default_service_account.default: Reading...
module.hashistack-csi.data.google_compute_default_service_account.default: Read complete after 1s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/serviceAccounts/906183014384-compute@developer.gserviceaccount.com]

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.hashistack.google_compute_firewall.allow-all-internal will be created
  + resource "google_compute_firewall" "allow-all-internal" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-all-internal"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "0-65535",
            ]
          + protocol = "tcp"
        }
      + allow {
          + ports    = [
              + "0-65535",
            ]
          + protocol = "udp"
        }
      + allow {
          + ports    = []
          + protocol = "icmp"
        }
    }

  # module.hashistack.google_compute_firewall.allow-http-external will be created
  + resource "google_compute_firewall" "allow-http-external" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-http-external"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]
      + target_tags        = [
          + "server",
        ]

      + allow {
          + ports    = [
              + "4646",
              + "8200",
              + "8500",
            ]
          + protocol = "tcp"
        }
    }

  # module.hashistack.google_compute_firewall.allow-ssh will be created
  + resource "google_compute_firewall" "allow-ssh" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-ssh"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "22",
            ]
          + protocol = "tcp"
        }
    }

  # module.hashistack.google_compute_instance.client[0] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=hc-e97f2ec769f746e995e1f7ae7de tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-1"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.client[1] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=hc-e97f2ec769f746e995e1f7ae7de tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-2"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.client[2] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=hc-e97f2ec769f746e995e1f7ae7de tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-3"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.server[0] will be created
  + resource "google_compute_instance" "server" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/server.sh "gce" "1" "provider=gce project_name=hc-e97f2ec769f746e995e1f7ae7de tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-server-1"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "server",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_network.hashistack will be created
  + resource "google_compute_network" "hashistack" {
      + auto_create_subnetworks         = false
      + delete_default_routes_on_create = false
      + gateway_ipv4                    = (known after apply)
      + id                              = (known after apply)
      + mtu                             = (known after apply)
      + name                            = "hashistack"
      + project                         = (known after apply)
      + routing_mode                    = (known after apply)
      + self_link                       = (known after apply)
    }

  # module.hashistack.google_compute_router.hashistack will be created
  + resource "google_compute_router" "hashistack" {
      + creation_timestamp = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-router"
      + network            = "hashistack"
      + project            = (known after apply)
      + region             = "us-east1"
      + self_link          = (known after apply)

      + bgp {
          + advertise_mode = "DEFAULT"
          + asn            = 64514
        }
    }

  # module.hashistack.google_compute_router_nat.hashistack will be created
  + resource "google_compute_router_nat" "hashistack" {
      + enable_endpoint_independent_mapping = true
      + icmp_idle_timeout_sec               = 30
      + id                                  = (known after apply)
      + name                                = "hashistack"
      + nat_ip_allocate_option              = "AUTO_ONLY"
      + project                             = (known after apply)
      + region                              = "us-east1"
      + router                              = "hashistack-router"
      + source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
      + tcp_established_idle_timeout_sec    = 1200
      + tcp_transitory_idle_timeout_sec     = 30
      + udp_idle_timeout_sec                = 30

      + log_config {
          + enable = true
          + filter = "ERRORS_ONLY"
        }
    }

  # module.hashistack.google_compute_subnetwork.hashistack will be created
  + resource "google_compute_subnetwork" "hashistack" {
      + creation_timestamp         = (known after apply)
      + external_ipv6_prefix       = (known after apply)
      + fingerprint                = (known after apply)
      + gateway_address            = (known after apply)
      + id                         = (known after apply)
      + ip_cidr_range              = "192.168.1.0/24"
      + ipv6_cidr_range            = (known after apply)
      + name                       = "hashistack"
      + network                    = "hashistack"
      + private_ipv6_google_access = (known after apply)
      + project                    = (known after apply)
      + purpose                    = (known after apply)
      + region                     = "us-east1"
      + secondary_ip_range         = (known after apply)
      + self_link                  = (known after apply)
      + stack_type                 = (known after apply)
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[0] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-1"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[1] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-2"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[2] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-3"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_project_iam_custom_role.nomad[0] will be created
  + resource "google_project_iam_custom_role" "nomad" {
      + deleted     = (known after apply)
      + description = "A description"
      + id          = (known after apply)
      + name        = (known after apply)
      + permissions = [
          + "compute.disks.get",
          + "compute.disks.use",
          + "compute.instances.attachDisk",
          + "compute.instances.detachDisk",
          + "compute.instances.get",
        ]
      + project     = (known after apply)
      + role_id     = "nomad"
      + stage       = "GA"
      + title       = "Nomad CSI"
    }

  # module.hashistack-csi.google_project_iam_member.nomad-sa-csi[0] will be created
  + resource "google_project_iam_member" "nomad-sa-csi" {
      + etag    = (known after apply)
      + id      = (known after apply)
      + member  = (known after apply)
      + project = "hc-e97f2ec769f746e995e1f7ae7de"
      + role    = (known after apply)
    }

  # module.hashistack-csi.google_service_account.nomad[0] will be created
  + resource "google_service_account" "nomad" {
      + account_id   = "nomad-sa"
      + disabled     = false
      + display_name = "Nomad CSI Account"
      + email        = (known after apply)
      + id           = (known after apply)
      + name         = (known after apply)
      + project      = (known after apply)
      + unique_id    = (known after apply)
    }

  # module.hashistack-csi.google_service_account_iam_member.gce-default-account-iam[0] will be created
  + resource "google_service_account_iam_member" "gce-default-account-iam" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = "roles/iam.serviceAccountUser"
      + service_account_id = "projects/hc-e97f2ec769f746e995e1f7ae7de/serviceAccounts/906183014384-compute@developer.gserviceaccount.com"
    }

  # module.hashistack-csi.google_service_account_iam_member.nomad-sa-csi[0] will be created
  + resource "google_service_account_iam_member" "nomad-sa-csi" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = (known after apply)
      + service_account_id = (known after apply)
    }

  # module.hashistack-csi.google_service_account_key.nomad-sa-key[0] will be created
  + resource "google_service_account_key" "nomad-sa-key" {
      + id                 = (known after apply)
      + key_algorithm      = "KEY_ALG_RSA_2048"
      + name               = (known after apply)
      + private_key        = (sensitive value)
      + private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
      + public_key         = (known after apply)
      + public_key_type    = "TYPE_X509_PEM_FILE"
      + service_account_id = (known after apply)
      + valid_after        = (known after apply)
      + valid_before       = (known after apply)
    }

  # module.hashistack-csi.local_file.nomad-sa-key-file[0] will be created
  + resource "local_file" "nomad-sa-key-file" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0600"
      + filename             = "nomad-sa-key.json"
      + id                   = (known after apply)
    }

Plan: 21 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + csi-disks = {
      + hashistack-csi-disk-1 = (known after apply)
      + hashistack-csi-disk-2 = (known after apply)
      + hashistack-csi-disk-3 = (known after apply)
    }

───────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
```

```
➜  us-east git:(main) ✗ terraform apply -auto-approve -var="project=${GOOGLE_PROJECT}" -var="credentials=${GOOGLE_APPLICATION_CREDENTIALS}"
module.hashistack-csi.data.google_compute_default_service_account.default: Reading...
module.hashistack-csi.data.google_compute_default_service_account.default: Read complete after 1s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/serviceAccounts/906183014384-compute@developer.gserviceaccount.com]

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.hashistack.google_compute_firewall.allow-all-internal will be created
  + resource "google_compute_firewall" "allow-all-internal" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-all-internal"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "0-65535",
            ]
          + protocol = "tcp"
        }
      + allow {
          + ports    = [
              + "0-65535",
            ]
          + protocol = "udp"
        }
      + allow {
          + ports    = []
          + protocol = "icmp"
        }
    }

  # module.hashistack.google_compute_firewall.allow-http-external will be created
  + resource "google_compute_firewall" "allow-http-external" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-http-external"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]
      + target_tags        = [
          + "server",
        ]

      + allow {
          + ports    = [
              + "4646",
              + "8200",
              + "8500",
            ]
          + protocol = "tcp"
        }
    }

  # module.hashistack.google_compute_firewall.allow-ssh will be created
  + resource "google_compute_firewall" "allow-ssh" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-ssh"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "22",
            ]
          + protocol = "tcp"
        }
    }

  # module.hashistack.google_compute_instance.client[0] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=hc-e97f2ec769f746e995e1f7ae7de tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-1"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.client[1] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=hc-e97f2ec769f746e995e1f7ae7de tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-2"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.client[2] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=hc-e97f2ec769f746e995e1f7ae7de tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-3"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.server[0] will be created
  + resource "google_compute_instance" "server" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/server.sh "gce" "1" "provider=gce project_name=hc-e97f2ec769f746e995e1f7ae7de tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-server-1"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "server",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_network.hashistack will be created
  + resource "google_compute_network" "hashistack" {
      + auto_create_subnetworks         = false
      + delete_default_routes_on_create = false
      + gateway_ipv4                    = (known after apply)
      + id                              = (known after apply)
      + mtu                             = (known after apply)
      + name                            = "hashistack"
      + project                         = (known after apply)
      + routing_mode                    = (known after apply)
      + self_link                       = (known after apply)
    }

  # module.hashistack.google_compute_router.hashistack will be created
  + resource "google_compute_router" "hashistack" {
      + creation_timestamp = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-router"
      + network            = "hashistack"
      + project            = (known after apply)
      + region             = "us-east1"
      + self_link          = (known after apply)

      + bgp {
          + advertise_mode = "DEFAULT"
          + asn            = 64514
        }
    }

  # module.hashistack.google_compute_router_nat.hashistack will be created
  + resource "google_compute_router_nat" "hashistack" {
      + enable_endpoint_independent_mapping = true
      + icmp_idle_timeout_sec               = 30
      + id                                  = (known after apply)
      + name                                = "hashistack"
      + nat_ip_allocate_option              = "AUTO_ONLY"
      + project                             = (known after apply)
      + region                              = "us-east1"
      + router                              = "hashistack-router"
      + source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
      + tcp_established_idle_timeout_sec    = 1200
      + tcp_transitory_idle_timeout_sec     = 30
      + udp_idle_timeout_sec                = 30

      + log_config {
          + enable = true
          + filter = "ERRORS_ONLY"
        }
    }

  # module.hashistack.google_compute_subnetwork.hashistack will be created
  + resource "google_compute_subnetwork" "hashistack" {
      + creation_timestamp         = (known after apply)
      + external_ipv6_prefix       = (known after apply)
      + fingerprint                = (known after apply)
      + gateway_address            = (known after apply)
      + id                         = (known after apply)
      + ip_cidr_range              = "192.168.1.0/24"
      + ipv6_cidr_range            = (known after apply)
      + name                       = "hashistack"
      + network                    = "hashistack"
      + private_ipv6_google_access = (known after apply)
      + project                    = (known after apply)
      + purpose                    = (known after apply)
      + region                     = "us-east1"
      + secondary_ip_range         = (known after apply)
      + self_link                  = (known after apply)
      + stack_type                 = (known after apply)
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[0] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-1"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[1] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-2"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[2] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-3"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_project_iam_custom_role.nomad[0] will be created
  + resource "google_project_iam_custom_role" "nomad" {
      + deleted     = (known after apply)
      + description = "A description"
      + id          = (known after apply)
      + name        = (known after apply)
      + permissions = [
          + "compute.disks.get",
          + "compute.disks.use",
          + "compute.instances.attachDisk",
          + "compute.instances.detachDisk",
          + "compute.instances.get",
        ]
      + project     = (known after apply)
      + role_id     = "nomad"
      + stage       = "GA"
      + title       = "Nomad CSI"
    }

  # module.hashistack-csi.google_project_iam_member.nomad-sa-csi[0] will be created
  + resource "google_project_iam_member" "nomad-sa-csi" {
      + etag    = (known after apply)
      + id      = (known after apply)
      + member  = (known after apply)
      + project = "hc-e97f2ec769f746e995e1f7ae7de"
      + role    = (known after apply)
    }

  # module.hashistack-csi.google_service_account.nomad[0] will be created
  + resource "google_service_account" "nomad" {
      + account_id   = "nomad-sa"
      + disabled     = false
      + display_name = "Nomad CSI Account"
      + email        = (known after apply)
      + id           = (known after apply)
      + name         = (known after apply)
      + project      = (known after apply)
      + unique_id    = (known after apply)
    }

  # module.hashistack-csi.google_service_account_iam_member.gce-default-account-iam[0] will be created
  + resource "google_service_account_iam_member" "gce-default-account-iam" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = "roles/iam.serviceAccountUser"
      + service_account_id = "projects/hc-e97f2ec769f746e995e1f7ae7de/serviceAccounts/906183014384-compute@developer.gserviceaccount.com"
    }

  # module.hashistack-csi.google_service_account_iam_member.nomad-sa-csi[0] will be created
  + resource "google_service_account_iam_member" "nomad-sa-csi" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = (known after apply)
      + service_account_id = (known after apply)
    }

  # module.hashistack-csi.google_service_account_key.nomad-sa-key[0] will be created
  + resource "google_service_account_key" "nomad-sa-key" {
      + id                 = (known after apply)
      + key_algorithm      = "KEY_ALG_RSA_2048"
      + name               = (known after apply)
      + private_key        = (sensitive value)
      + private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
      + public_key         = (known after apply)
      + public_key_type    = "TYPE_X509_PEM_FILE"
      + service_account_id = (known after apply)
      + valid_after        = (known after apply)
      + valid_before       = (known after apply)
    }

  # module.hashistack-csi.local_file.nomad-sa-key-file[0] will be created
  + resource "local_file" "nomad-sa-key-file" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0600"
      + filename             = "nomad-sa-key.json"
      + id                   = (known after apply)
    }

Plan: 21 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + csi-disks = {
      + hashistack-csi-disk-1 = (known after apply)
      + hashistack-csi-disk-2 = (known after apply)
      + hashistack-csi-disk-3 = (known after apply)
    }
module.hashistack-csi.google_service_account.nomad[0]: Creating...
module.hashistack.google_compute_network.hashistack: Creating...
module.hashistack-csi.google_project_iam_custom_role.nomad[0]: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[1]: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[2]: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[0]: Creating...
module.hashistack-csi.google_service_account.nomad[0]: Creation complete after 1s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/serviceAccounts/nomad-sa@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com]
module.hashistack-csi.google_project_iam_custom_role.nomad[0]: Creation complete after 1s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/roles/nomad]
module.hashistack-csi.google_compute_disk.csi-disk[2]: Creation complete after 1s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/disks/hashistack-csi-disk-3]
module.hashistack-csi.google_compute_disk.csi-disk[1]: Creation complete after 1s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/disks/hashistack-csi-disk-2]
module.hashistack-csi.google_service_account_key.nomad-sa-key[0]: Creating...
module.hashistack-csi.google_service_account_iam_member.gce-default-account-iam[0]: Creating...
module.hashistack-csi.google_project_iam_member.nomad-sa-csi[0]: Creating...
module.hashistack-csi.google_service_account_iam_member.nomad-sa-csi[0]: Creating...
module.hashistack-csi.google_service_account_key.nomad-sa-key[0]: Creation complete after 1s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/serviceAccounts/nomad-sa@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com/keys/75aa10ba9f2ce99493f3403fe9c2e1d8ff31b42c]
module.hashistack-csi.local_file.nomad-sa-key-file[0]: Creating...
module.hashistack-csi.local_file.nomad-sa-key-file[0]: Creation complete after 0s [id=5bb6c444008d18fb382e725d3b6ca1b9389881c9]
module.hashistack-csi.google_service_account_iam_member.gce-default-account-iam[0]: Creation complete after 5s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/serviceAccounts/906183014384-compute@developer.gserviceaccount.com/roles/iam.serviceAccountUser/serviceAccount:nomad-sa@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com]
module.hashistack-csi.google_service_account_iam_member.nomad-sa-csi[0]: Creation complete after 5s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/serviceAccounts/nomad-sa@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com/projects/hc-e97f2ec769f746e995e1f7ae7de/roles/nomad/serviceAccount:nomad-sa@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com]
module.hashistack-csi.google_project_iam_member.nomad-sa-csi[0]: Creation complete after 9s [id=hc-e97f2ec769f746e995e1f7ae7de/projects/hc-e97f2ec769f746e995e1f7ae7de/roles/nomad/serviceAccount:nomad-sa@hc-e97f2ec769f746e995e1f7ae7de.iam.gserviceaccount.com]
module.hashistack.google_compute_network.hashistack: Still creating... [10s elapsed]
module.hashistack-csi.google_compute_disk.csi-disk[0]: Still creating... [10s elapsed]
module.hashistack-csi.google_compute_disk.csi-disk[0]: Creation complete after 11s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/disks/hashistack-csi-disk-1]
module.hashistack.google_compute_network.hashistack: Creation complete after 11s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/global/networks/hashistack]
module.hashistack.google_compute_router.hashistack: Creating...
module.hashistack.google_compute_subnetwork.hashistack: Creating...
module.hashistack.google_compute_firewall.allow-ssh: Creating...
module.hashistack.google_compute_firewall.allow-http-external: Creating...
module.hashistack.google_compute_firewall.allow-all-internal: Creating...
module.hashistack.google_compute_router.hashistack: Still creating... [10s elapsed]
module.hashistack.google_compute_subnetwork.hashistack: Still creating... [10s elapsed]
module.hashistack.google_compute_firewall.allow-http-external: Still creating... [10s elapsed]
module.hashistack.google_compute_firewall.allow-ssh: Still creating... [10s elapsed]
module.hashistack.google_compute_firewall.allow-all-internal: Still creating... [10s elapsed]
module.hashistack.google_compute_firewall.allow-ssh: Creation complete after 12s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/global/firewalls/hashistack-allow-ssh]
module.hashistack.google_compute_firewall.allow-all-internal: Creation complete after 12s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/global/firewalls/hashistack-allow-all-internal]
module.hashistack.google_compute_router.hashistack: Creation complete after 12s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/regions/us-east1/routers/hashistack-router]
module.hashistack.google_compute_router_nat.hashistack: Creating...
module.hashistack.google_compute_firewall.allow-http-external: Creation complete after 12s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/global/firewalls/hashistack-allow-http-external]
module.hashistack.google_compute_subnetwork.hashistack: Creation complete after 12s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/regions/us-east1/subnetworks/hashistack]
module.hashistack.google_compute_instance.client[0]: Creating...
module.hashistack.google_compute_instance.client[1]: Creating...
module.hashistack.google_compute_instance.server[0]: Creating...
module.hashistack.google_compute_instance.client[2]: Creating...
module.hashistack.google_compute_router_nat.hashistack: Still creating... [10s elapsed]
module.hashistack.google_compute_instance.server[0]: Still creating... [10s elapsed]
module.hashistack.google_compute_instance.client[1]: Still creating... [10s elapsed]
module.hashistack.google_compute_instance.client[2]: Still creating... [10s elapsed]
module.hashistack.google_compute_instance.client[0]: Still creating... [10s elapsed]
module.hashistack.google_compute_router_nat.hashistack: Creation complete after 11s [id=hc-e97f2ec769f746e995e1f7ae7de/us-east1/hashistack-router/hashistack]
module.hashistack.google_compute_instance.client[0]: Still creating... [20s elapsed]
module.hashistack.google_compute_instance.client[2]: Still creating... [20s elapsed]
module.hashistack.google_compute_instance.client[1]: Still creating... [20s elapsed]
module.hashistack.google_compute_instance.server[0]: Still creating... [20s elapsed]
module.hashistack.google_compute_instance.server[0]: Still creating... [30s elapsed]
module.hashistack.google_compute_instance.client[0]: Still creating... [30s elapsed]
module.hashistack.google_compute_instance.client[1]: Still creating... [30s elapsed]
module.hashistack.google_compute_instance.client[2]: Still creating... [30s elapsed]
module.hashistack.google_compute_instance.server[0]: Creation complete after 33s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/instances/hashistack-server-1]
module.hashistack.google_compute_instance.client[1]: Creation complete after 34s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/instances/hashistack-client-2]
module.hashistack.google_compute_instance.client[0]: Creation complete after 34s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/instances/hashistack-client-1]
module.hashistack.google_compute_instance.client[2]: Creation complete after 35s [id=projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/instances/hashistack-client-3]

Apply complete! Resources: 21 added, 0 changed, 0 destroyed.

Outputs:

csi-disks = {
  "hashistack-csi-disk-1" = "https://www.googleapis.com/compute/v1/projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/disks/hashistack-csi-disk-1"
  "hashistack-csi-disk-2" = "https://www.googleapis.com/compute/v1/projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/disks/hashistack-csi-disk-2"
  "hashistack-csi-disk-3" = "https://www.googleapis.com/compute/v1/projects/hc-e97f2ec769f746e995e1f7ae7de/zones/us-east1-c/disks/hashistack-csi-disk-3"
}
➜  us-east git:(main) ✗
```
