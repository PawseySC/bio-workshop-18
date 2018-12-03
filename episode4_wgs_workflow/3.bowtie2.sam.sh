#!/bin/bash
run_flags="--rm -v $(pwd):/data -w /data"

cp -p ../data_files/Fagopyrum_esculentum.fasta .

bowtie2-build Fagopyrum_esculentum.fasta FagoEsc_ref

bowtie2 -k 5 -x FagoEsc_ref -1 SRR6166481_sub_1_paired.fastq.gz -2 SRR6166481_sub_2_paired.fastq.gz -S SRR6166481_sub.sam --al-conc-gz SRR6166481_sub_hitting.fastq.gz

samtools view -bS SRR6166481_sub.sam >SRR6166481_sub.bam
