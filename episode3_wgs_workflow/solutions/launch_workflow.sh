#!/bin/bash

./1.fastqc.sh
./2.trimmomatic.sh
./3.bowtie2.sam.sh
./4.velvet.sh
./5.mummer4.sh
./6.bcftools.sam.sh 
