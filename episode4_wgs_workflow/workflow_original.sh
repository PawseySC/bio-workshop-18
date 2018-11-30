#!/bin/bash

# 1. Quality control - FastQC
cp -p ../data_files/SRR6166481_sub_[12].fastq.gz .
#
fastqc -o . SRR6166481_sub_1.fastq.gz
fastqc -o . SRR6166481_sub_2.fastq.gz


# 2. Cleaning - Trimmomatic
java -jar <path-to-trimmomatic-jar>/trimmomatic.jar \
    PE SRR6166481_sub_1.fastq.gz SRR6166481_sub_2.fastq.gz \
    SRR6166481_sub_1_paired.fastq.gz SRR6166481_sub_1_unpaired.fastq.gz \
    SRR6166481_sub_2_paired.fastq.gz SRR6166481_sub_2_unpaired.fastq.gz \
    ILLUMINACLIP:adapters/all_PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36


# 3. Read alignment against reference - Bowtie2
cp -p ../data_files/Fagopyrum_esculentum.fasta .
#
bowtie2-build Fagopyrum_esculentum.fasta FagoEsc_ref
bowtie2 -k 5 -x FagoEsc_ref -1 SRR6166481_sub_1_paired.fastq.gz -2 SRR6166481_sub_2_paired.fastq.gz -S SRR6166481_sub.sam --al-conc-gz SRR6166481_sub_hitting.fastq.gz
# Compress to bam format
samtools view -bS SRR6166481_sub.sam >SRR6166481_sub.bam


# 4. Assembly - Velvet
velveth out_velvet 29 -shortPaired -fastq.gz -separate SRR6166481_sub_1_paired.fastq.gz SRR6166481_sub_2_paired.fastq.gz
velvetg out_velvet -exp_cov 100 -min_contig_lgth 2000 -ins_length 300 -cov_cutoff 50 -clean yes
#
cp -p out_velvet/contigs.fa SRR6166481_sub_contigs.fa


# 5. Contig alignment with references - Mummer4
mummer -b Fagopyrum_esculentum.fasta SRR6166481_sub_contigs.fa >SRR6166481_sub_mummer.out
mummerplot -png -p SRR6166481_sub_mummer SRR6166481_sub_mummer.out   # plotting
#
gnuplot SRR6166481_sub_mummer.gp   # requires gnuplot installed


# 6. SNP Calling - Samtools + Bcftools
# Sorting BAM file
samtools sort -o SRR6166481_sub_sorted.bam SRR6166481_sub.bam
# Indexing
samtools index SRR6166481_sub_sorted.bam
# SNP calling
samtools mpileup -uf Fagopyrum_esculentum.fasta SRR6166481_sub_sorted.bam | bcftools call -o SRR6166481_sub_var_raw.bcf -Ob -v -c -
bcftools view SRR6166481_sub_var_raw.bcf | vcfutils.pl varFilter -D 100 > SRR6166481_sub_var_flt.vcf
