#!/bin/bash

# this is not required for pulling
# docker login -u 'user' -p 'password' quay.io

ubuntu_cont=ubuntu

docker pull $ubuntu_cont
