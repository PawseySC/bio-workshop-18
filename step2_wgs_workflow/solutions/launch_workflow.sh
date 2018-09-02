#!/bin/bash

bash 0.pull_containers_for_loop.sh && \
bash 1.fastqc.sh && \
bash 2.trimmomatic.sh && \
bash 3.bowtie2.sam.sh && \
bash 4.velvet.sh && \
bash 5.mummer4.sh && \
bash 6.bcftools.sam.sh 
