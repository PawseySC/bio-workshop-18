#!/bin/bash

trimmomatic_cont=quay.io/biocontainers/trimmomatic:0.38--0
run_flags="--rm -v $(pwd):/data -w /data"

# note: need to look into container for location of .jar
docker run $run_flags $trimmomatic_cont java -jar /usr/local/share/trimmomatic-0.38-0/trimmomatic.jar \
    PE SRR6166481_sub_1.fastq.gz SRR6166481_sub_2.fastq.gz \
    SRR6166481_sub_1_paired.fastq.gz SRR6166481_sub_1_unpaired.fastq.gz \
    SRR6166481_sub_2_paired.fastq.gz SRR6166481_sub_2_unpaired.fastq.gz \
    ILLUMINACLIP:adapters/all_PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

# alternative way, using launch script provided by specific container
#docker run $run_flags $trimmomatic_cont trimmomatic \
#    PE SRR6166481_sub_1.fastq.gz SRR6166481_sub_2.fastq.gz \
#    SRR6166481_sub_1_paired.fastq.gz SRR6166481_sub_1_unpaired.fastq.gz \
#    SRR6166481_sub_2_paired.fastq.gz SRR6166481_sub_2_unpaired.fastq.gz \
#    ILLUMINACLIP:adapters/all_PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
