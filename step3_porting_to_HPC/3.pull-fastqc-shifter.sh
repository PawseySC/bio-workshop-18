#!/bin/bash -l

module load shifter


fastqc_cont=quay.io/biocontainers/fastqc:0.11.7--4

shifter pull --login $fastqc_cont
# credentials for quay.io will be requested
