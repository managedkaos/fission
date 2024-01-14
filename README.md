# fission
Working with fission

## Install and Set Up
33001  2024-01-03 15:23:03 export FISSION_NAMESPACE="fission"
33002  2024-01-03 15:23:05 kubectl create namespace $FISSION_NAMESPACE
33003  2024-01-03 15:23:10 kubectl create -k "github.com/fission/fission/crds/v1?ref=v1.20.0"
33005  2024-01-03 15:23:25 helm repo add fission-charts https://fission.github.io/fission-charts/
33007  2024-01-03 15:23:38 helm install --version v1.20.0 --namespace $FISSION_NAMESPACE fission fission-charts/fission-all
33014  2024-01-03 15:27:04 which fission # How was CLI installed?
33016  2024-01-03 15:27:16 fission version
33017  2024-01-03 15:27:31 fission check

## Create Python environment
33018  2024-01-03 15:27:53 fission env create --name python --image fission/python-env

## Hello, World!
33019  2024-01-03 15:28:02 curl -LO https://raw.githubusercontent.com/fission/examples/main/python/hello.py
33020  2024-01-03 15:28:10 fission function create --name hello-py --env python --code hello.py
33021  2024-01-03 15:28:16 fission function test --name hello-py

## Deploy a Lambda Function
33036  2024-01-03 15:30:36 fission function create --name index --env python --code index.py
33041  2024-01-03 15:32:28 fission function update --name index --env python --code index.py
33042  2024-01-03 15:32:31 fission function test --name index
33050  2024-01-03 15:37:55 fission route create --url /index --function index
33051  2024-01-03 15:38:07 fission route list
33725  2024-01-14 14:12:32 curl http://router.k8s.orb.local/index

