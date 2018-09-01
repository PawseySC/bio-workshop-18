#!/bin/bash
  
# this is not required for pulling
# docker login -u 'user' -p 'password' quay.io


docker pull quay.io/biocontainers/fastqc:0.11.7--4
docker pull quay.io/biocontainers/trimmomatic:0.38--0
docker pull quay.io/biocontainers/bowtie2:2.3.4.2--py27h2d50403_0
docker pull quay.io/biocontainers/samtools:1.9--h46bd0b3_0
docker pull quay.io/biocontainers/velvet:1.2.10--1
docker pull biocontainers/mummer:v3.23dfsg-2-deb_cv1
docker pull quay.io/biocontainers/bcftools:1.9--h4da6232_0
