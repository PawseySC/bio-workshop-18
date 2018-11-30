#!/bin/bash
run_flags="--rm -v $(pwd):/data -w /data"

cp -p ../data_files/SRR6166481_sub_[12].fastq.gz .

docker run $run_flags quay.io/biocontainers/fastqc:0.11.7--4 fastqc -o . SRR6166481_sub_1.fastq.gz

docker run $run_flags quay.io/biocontainers/fastqc:0.11.7--4 fastqc -o . SRR6166481_sub_2.fastq.gz
