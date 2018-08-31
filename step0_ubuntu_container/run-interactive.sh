#!/bin/bash

# this is not required for pulling
# docker login -u 'user' -p 'password' quay.io

ubuntu_cont=ubuntu

run_flags="-it --rm"

docker run $run_flags $ubuntu_cont 
