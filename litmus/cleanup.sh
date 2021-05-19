#!/bin/bash
set -ex
path=$(pwd)

# # Setting up the kubeconfig
mkdir -p ~/.kube

aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}

cp $path/.kube/config ~/.kube/config
cp $path/.kube/admin.conf ~/.kube/config

# Shutting down the Litmus-Portal Setup
kubectl delete -f https://raw.githubusercontent.com/litmuschaos/litmus/master/litmus-portal/cluster-k8s-manifest.yml
