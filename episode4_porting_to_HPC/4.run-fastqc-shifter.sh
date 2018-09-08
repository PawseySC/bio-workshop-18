#!/bin/bash -l

module load shifter

cp -p ../data_files/SRR6166481_sub_1.fastq.gz .

shifter run quay.io/biocontainers/fastqc:0.11.7--4 fastqc SRR6166481_sub_1.fastq.gz
