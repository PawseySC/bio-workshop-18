#!/bin/bash
run_flags="--rm -v $(pwd):/data -w /data"

mummer -b Fagopyrum_esculentum.fasta SRR6166481_sub_contigs.fa >SRR6166481_sub_mummer.out

mummerplot -png -p SRR6166481_sub_mummer SRR6166481_sub_mummer.out

gnuplot SRR6166481_sub_mummer.gp
