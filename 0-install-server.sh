#!/bin/bash

export FISSION_VERSION=v1.21.0
export FISSION_NAMESPACE="fission"
kubectl create namespace $FISSION_NAMESPACE
kubectl create -k "github.com/fission/fission/crds/v1?ref=$FISSION_VERSION"
helm repo add fission-charts https://fission.github.io/fission-charts/
helm install --version $FISSION_VERSION --namespace $FISSION_NAMESPACE fission fission-charts/fission-all
which fission
fission version
fission check

