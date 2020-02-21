#!/bin/bash
gcloud sql users create grafana       --host=cloudsqlproxy~% --instance=mysql-1
gcloud sql users create hosted-agent  --host=cloudsqlproxy~% --instance=mysql-1
gcloud sql users create loan          --host=cloudsqlproxy~% --instance=mysql-1

gcloud iam service-accounts keys create credentials.json --iam-account=splus-cloudsql@screeps-159019.iam.gserviceaccount.com
kubectl create secret generic cloudsql --from-file=credentials.json
rm credentials.json