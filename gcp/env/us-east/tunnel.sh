#!/bin/sh
gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:4646:127.0.0.1:4646
gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:8500:127.0.0.1:8500
gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:8200:127.0.0.1:8200
