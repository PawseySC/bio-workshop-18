#!/bin/bash

ubuntu_cont=ubuntu
run_flags="-it --rm -v $(pwd):/data -w /data"

docker run $run_flags $ubuntu_cont 
