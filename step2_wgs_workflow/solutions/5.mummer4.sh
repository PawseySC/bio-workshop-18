#!/bin/bash

mummer4_cont=quay.io/biocontainers/mummer4:4.0.0beta2--pl526hfc679d8_3
run_flags="--rm -v $(pwd):/data -w /data"

docker run $run_flags $mummer4_cont mummer -b Fagopyrum_esculentum.fasta SRR6166481_sub_contigs.fa >SRR6166481_sub_mummer.out
docker run $run_flags $mummer4_cont mummerplot -png -p SRR6166481_sub_mummer SRR6166481_sub_mummer.out


