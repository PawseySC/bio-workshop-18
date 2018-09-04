#!/bin/bash

# note: we are defining two distinc container variables for usage in this script
bowtie2_cont=quay.io/biocontainers/bowtie2:2.3.4.2--py27h2d50403_0
samtools_cont=quay.io/biocontainers/samtools:1.9--h46bd0b3_0
run_flags="--rm -v $(pwd):/data -w /data"

cp -p ../data_files/Fagopyrum_esculentum.fasta .

# hint: you will need to use different containers for the different operations
