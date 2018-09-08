#!/bin/bash

cp -p ../data_files/SRR6166481_sub_1.fastq.gz .

docker run --rm -v $(pwd):/data -w /data quay.io/biocontainers/fastqc:0.11.7--4 fastqc SRR6166481_sub_1.fastq.gz
