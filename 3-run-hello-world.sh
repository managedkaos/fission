#!/bin/bash

curl -LO https://raw.githubusercontent.com/fission/examples/main/python/hello.py
fission function create --name hello-py --env python --code hello.py
fission function test --name hello-py

