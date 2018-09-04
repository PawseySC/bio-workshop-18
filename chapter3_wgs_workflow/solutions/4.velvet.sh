#!/bin/bash

velvet_cont=quay.io/biocontainers/velvet:1.2.10--1
run_flags="--rm -v $(pwd):/data -w /data"

docker run $run_flags $velvet_cont velveth out_velvet 29 -shortPaired -fastq.gz -separate SRR6166481_sub_1_paired.fastq.gz SRR6166481_sub_2_paired.fastq.gz

docker run $run_flags $velvet_cont velvetg out_velvet -exp_cov 100 -min_contig_lgth 2000 -ins_length 300 -cov_cutoff 50 -clean yes

cp -p out_velvet/contigs.fa SRR6166481_sub_contigs.fa
