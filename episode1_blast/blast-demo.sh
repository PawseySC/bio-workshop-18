#!/bin/bash

docker pull biocontainers/blast:v2.2.31_cv2

cp -p ../data_files/P04156.fasta .
cp -p ../data_files/zebrafish.1.protein.faa.gz .
gunzip zebrafish.1.protein.faa.gz

docker run --rm -v $(pwd):/data -w /data biocontainers/blast:v2.2.31_cv2 makeblastdb -in zebrafish.1.protein.faa -dbtype prot

docker run --rm -v $(pwd):/data -w /data biocontainers/blast:v2.2.31_cv2 blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt

