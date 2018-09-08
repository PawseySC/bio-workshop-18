#!/bin/bash
run_flags="--rm -v $(pwd):/data -w /data"

cp -p ../data_files/SRR6166481_sub_[12].fastq.gz .

fastqc -o . SRR6166481_sub_1.fastq.gz

fastqc -o . SRR6166481_sub_2.fastq.gz
