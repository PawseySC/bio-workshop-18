#!/bin/bash

samtools_cont=quay.io/biocontainers/samtools:1.9--h46bd0b3_0
bcftools_cont=quay.io/biocontainers/bcftools:1.9--h4da6232_0
run_flags="--rm -v $(pwd):/data -w /data"

#docker run $run_flags $samtools_cont samtools sort -o SRR6166481_sub_sorted.bam SRR6166481_sub.bam

#docker run $run_flags $samtools_cont samtools index SRR6166481_sub_sorted.bam

#docker run $run_flags 



# samtools mpileup -uf YOUR_REFERENCE.fasta All_output_sorted.bam | bcftools view -bvcg - > var.raw.bcf
# bcftools view var.raw.bcf | /usr/share/samtools/vcfutils.pl varFilter -D100 > var.flt.vcf

