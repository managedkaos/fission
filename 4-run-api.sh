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

