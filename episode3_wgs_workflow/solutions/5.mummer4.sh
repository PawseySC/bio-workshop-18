#!/bin/bash
run_flags="--rm -v $(pwd):/data -w /data"

docker run $run_flags quay.io/biocontainers/mummer4:4.0.0beta2--pl526hfc679d8_3 mummer \
    -b Fagopyrum_esculentum.fasta SRR6166481_sub_contigs.fa >SRR6166481_sub_mummer.out

docker run $run_flags quay.io/biocontainers/mummer4:4.0.0beta2--pl526hfc679d8_3 mummerplot \
    -png -p SRR6166481_sub_mummer SRR6166481_sub_mummer.out

gnuplot SRR6166481_sub_mummer.gp
