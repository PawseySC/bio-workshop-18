#!/bin/bash
run_flags="--rm -v $(pwd):/data -w /data"

java -jar <path-to-trimmomatic-jar>/trimmomatic.jar \
	PE SRR6166481_sub_1.fastq.gz SRR6166481_sub_2.fastq.gz \
	SRR6166481_sub_1_paired.fastq.gz SRR6166481_sub_1_unpaired.fastq.gz \
	SRR6166481_sub_2_paired.fastq.gz SRR6166481_sub_2_unpaired.fastq.gz \
	ILLUMINACLIP:adapters/all_PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
