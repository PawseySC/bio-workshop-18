#!/bin/bash

# note: we are defining two distinc container variables for usage in this script
bowtie2_cont=
samtools_cont=
run_flags=

cp -p ../data_files/Fagopyrum_esculentum.fasta .

# hint: you will need to use different containers for the different operations
