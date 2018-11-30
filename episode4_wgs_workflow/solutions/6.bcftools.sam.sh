#!/bin/bash
run_flags="--rm -v $(pwd):/data -w /data"

docker run $run_flags quay.io/biocontainers/samtools:1.9--h46bd0b3_0 samtools \
    sort -o SRR6166481_sub_sorted.bam SRR6166481_sub.bam

docker run $run_flags quay.io/biocontainers/samtools:1.9--h46bd0b3_0 samtools \
    index SRR6166481_sub_sorted.bam

docker run $run_flags quay.io/biocontainers/samtools:1.9--h46bd0b3_0 samtools \
    mpileup -uf Fagopyrum_esculentum.fasta SRR6166481_sub_sorted.bam | \
    docker run -i $run_flags biocontainers/bcftools:v1.3.1-1b1-deb_cv1 bcftools \
    call -o SRR6166481_sub_var_raw.bcf -Ob -v -c -

docker run $run_flags biocontainers/bcftools:v1.3.1-1b1-deb_cv1 bcftools \
    view SRR6166481_sub_var_raw.bcf | \
    docker run -i $run_flags biocontainers/bcftools:v1.3.1-1b1-deb_cv1 vcfutils.pl \
    varFilter -D 100 >SRR6166481_sub_var_flt.vcf
