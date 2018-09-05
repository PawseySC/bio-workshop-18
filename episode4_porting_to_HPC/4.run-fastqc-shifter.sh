#!/bin/bash -l

module load shifter


fastqc_cont=quay.io/biocontainers/fastqc:0.11.7--4

cp -p ../data_files/SRR6166481_sub_1.fastq.gz .

# /group and /scratch are visible on Pawsey HPC systems
shifter run $fastqc_cont fastqc SRR6166481_sub_1.fastq.gz
