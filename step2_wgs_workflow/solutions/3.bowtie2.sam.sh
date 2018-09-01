#!/bin/bash

bowtie2_cont=quay.io/biocontainers/bowtie2:2.3.4.2--py27h2d50403_0
samtools_cont=quay.io/biocontainers/samtools:1.9--h46bd0b3_0
run_flags="--rm -v $(pwd):/data -w /data"

cp -p ../data_files/Fagopyrum_esculentum.fasta .

docker run $run_flags $bowtie2_cont bowtie2-build Fagopyrum_esculentum.fasta FagoEsc_ref
docker run $run_flags $bowtie2_cont bowtie2 -k 5 -x FagoEsc_ref -1 SRR6166481_10k_1_paired.fastq.gz -2 SRR6166481_10k_2_paired.fastq.gz -S SRR6166481_10k.sam --al-conc-gz SRR6166481_10k_hitting.fastq.gz

docker run $run_flags $samtools_cont samtools view -bS SRR6166481_10k.sam >SRR6166481_10k.bam
