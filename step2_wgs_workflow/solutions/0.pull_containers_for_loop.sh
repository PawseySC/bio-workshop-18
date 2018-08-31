#!/bin/bash
  
# this is not required for pulling
# docker login -u 'user' -p 'password' quay.io

for p in $(cat ../containers) ; do
  docker pull $p
done
