#!/bin/bash

export FISSION_VERSION="v1.21.0"
export BIN_PATH="/usr/local/bin/"
curl -Lo fission "https://github.com/fission/fission/releases/download/${FISSION_VERSION}/fission-${FISSION_VERSION}-darwin-amd64"

ls -ltr ./fission && chmod +x ./fission

sudo mv ./fission "${BIN_PATH}" && ls -ltr "${BIN_PATH}"/fission

"${BIN_PATH}"/fission version
