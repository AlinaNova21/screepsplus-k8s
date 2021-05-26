#!/bin/bash
kubectl delete secret screeps -n loan
kubectl create secret generic screeps --from-file=.screeps.yml -n loan