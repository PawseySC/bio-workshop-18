#!/bin/bash

trimmomatic_cont=quay.io/biocontainers/trimmomatic:0.38--0
run_flags="--rm -v $(pwd):/data -w /data"

# hint: to prepare this script you will first need to look inside the container, using an interactive session, to find the path for trimmomatic.jar
