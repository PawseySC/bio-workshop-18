#!/bin/bash

velvet_cont=quay.io/biocontainers/velvet:1.2.10--1
run_flags="--rm -v $(pwd):/data -w /data"

# container commands here
#

# copying the contigs output back in the current directory
cp -p out_velvet/contigs.fa SRR6166481_sub_contigs.fa
