#!/bin/bash

samtools_cont=quay.io/biocontainers/samtools:1.9--h46bd0b3_0
bcftools_cont=biocontainers/bcftools:v1.3.1-1b1-deb_cv1
run_flags="--rm -v $(pwd):/data -w /data"

docker run $run_flags $samtools_cont samtools sort -o SRR6166481_sub_sorted.bam SRR6166481_sub.bam

docker run $run_flags $samtools_cont samtools index SRR6166481_sub_sorted.bam

# note the use of pipes in the following
docker run    $run_flags $samtools_cont samtools mpileup -uf Fagopyrum_esculentum.fasta SRR6166481_sub_sorted.bam | \
docker run -i $run_flags $bcftools_cont bcftools call -o SRR6166481_sub_var_raw.bcf -Ob -v -c -

docker run    $run_flags $bcftools_cont bcftools view SRR6166481_sub_var_raw.bcf | \
docker run -i $run_flags $bcftools_cont vcfutils.pl varFilter -D 100 >SRR6166481_sub_var_flt.vcf

# alternative way: no pipes
#docker run $run_flags $samtools_cont samtools mpileup -o SRR6166481_sub_mpiledup.bcf -uf Fagopyrum_esculentum.fasta SRR6166481_sub_sorted.bam
#docker run $run_flags $bcftools_cont bcftools call -o SRR6166481_sub_var_raw.vcf -Ov -v -c SRR6166481_sub_mpiledup.bcf
#docker run $run_flags $bcftools_cont vcfutils.pl varFilter -D 100 SRR6166481_sub_var_raw.vcf >SRR6166481_sub_var_flt.vcf

