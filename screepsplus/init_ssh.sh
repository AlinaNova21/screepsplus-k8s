#!/bin/bash
mkdir .ssh
pushd .ssh
ssh-keygen -q -f ./id_rsa
ssh-copy-id -i ./id_rsa root@screepspl.us
ssh-keyscan -H screepspl.us >> known_hosts
kubectl delete secret splus-ssh
kubectl create secret generic splus-ssh --from-file ./
popd
rm -rf .ssh