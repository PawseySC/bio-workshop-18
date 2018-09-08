#!/bin/bash
run_flags="--rm -v $(pwd):/data -w /data"

samtools sort -o SRR6166481_sub_sorted.bam SRR6166481_sub.bam

samtools index SRR6166481_sub_sorted.bam

samtools mpileup -uf Fagopyrum_esculentum.fasta SRR6166481_sub_sorted.bam | bcftools call -o SRR6166481_sub_var_raw.bcf -Ob -v -c -

bcftools view SRR6166481_sub_var_raw.bcf | vcfutils.pl varFilter -D 100 > SRR6166481_sub_var_flt.vcf
