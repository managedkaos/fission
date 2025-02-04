# fission

Working with fission

## Install and Set Up

- Run `./0-install-server.sh` to install the server

```
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
```

## Install the CLI

- Run `./1-install-cli.sh` to install the CLI

```
#!/bin/bash

export FISSION_VERSION="v1.21.0"
export BIN_PATH="/usr/local/bin/"
curl -Lo fission "https://github.com/fission/fission/releases/download/${FISSION_VERSION}/fission-${FISSION_VERSION}-darwin-amd64"

ls -ltr ./fission && chmod +x ./fission

sudo mv ./fission "${BIN_PATH}" && ls -ltr "${BIN_PATH}"/fission

"${BIN_PATH}"/fission version
```

## Create Python environment

- Run `./2-create-python-env.sh` to create a Python environment

```
fission env create --name python --image fission/python-env
```

## Hello, World!

- Run `./3-run-hello-world.sh` to create a Python function

```
#!/bin/bash

curl -LO https://raw.githubusercontent.com/fission/examples/main/python/hello.py
fission function create --name hello-py --env python --code hello.py
fission function test --name hello-py

```

## Deploy a Lambda Function

- Run `./4-run-api.sh` to deploy a Lambda function

```
#!/bin/bash

echo "# Create or update the function"
fission function create \
    --verbosity=0 \
    --name api \
    --env python \
    --code ./api.py > /dev/null \
    || echo "# Update the function" &&
    fission function update \
    --name api \
    --env python \
    --code ./api.py

echo
echo
echo "# Test the function by invoking it directly"
fission function test --name api

echo
echo
echo "# Create a route to the function or list the current routes if it already exists"
fission route create \
    --name api \
    --url /api \
    --function api > /dev/null \
    || fission route list

echo
echo
echo "# Test the route by curling it"

curl -sLk --max-time 3 -w "%{json}" \
    "http://router.k8s.orb.local/api" | jq .
```
