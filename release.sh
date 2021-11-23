#!/bin/bash

docker built . -t dp8s --no-cache
docker tag dp8s spiksius/dp8s:$@
docker tag spiksius/dp8s:$@ spiksius/dp8s:latest
docker push spiksius/dp8s:$@
docker push spiksius/dp8s:latest