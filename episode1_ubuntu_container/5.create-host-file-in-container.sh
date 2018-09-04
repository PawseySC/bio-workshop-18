#!/bin/bash

ubuntu_cont=ubuntu
run_flags="--rm -v $(pwd):/data -w /data"

echo Creating file inside container
docker run $run_flags $ubuntu_cont echo "Sunny day in Perth!" >weather
echo Displaying file outside container
cat weather
ls -l weather
