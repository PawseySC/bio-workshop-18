#!/bin/bash

samtools_cont=quay.io/biocontainers/samtools:1.9--h46bd0b3_0
bcftools_cont=biocontainers/bcftools:v1.3.1-1b1-deb_cv1
run_flags="--rm -v $(pwd):/data -w /data"

# hint: the last two commands of this script require piping between docker run commands. an extra flag is required to achieve this.
