#!/bin/bash

velvet_cont=quay.io/biocontainers/velvet:1.2.10--1
run_flags="--rm -v $(pwd):/data -w /data"

#docker run $run_flags $velvet_cont velveth velvet 29 -shortPaired -fastq.gz -separate SRR6166481_10k_hitting.fastq.1.gz SRR6166481_10k_hitting.fastq.2.gz
docker run $run_flags $velvet_cont velveth velvet 29 -shortPaired -fastq.gz -separate SRR6166481_10k_1_paired.fastq.gz SRR6166481_10k_2_paired.fastq.gz
echo ASPETTA PIPPO ASPETTA
docker run $run_flags $velvet_cont velvetg velvet -exp_cov 100 -min_contig_lgth 2000 -ins_length 300 -cov_cutoff 50 -clean yes
cp -p velvet/contigs.fa .
