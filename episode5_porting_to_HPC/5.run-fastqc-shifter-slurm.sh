#!/bin/bash -l

#SBATCH --account=<your-pawsey-project>
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE
#SBATCH --job-name=fastqc

module load shifter

cp -p ../data_files/SRR6166481_sub_1.fastq.gz .

srun --export=all shifter run quay.io/biocontainers/fastqc:0.11.7--4 fastqc SRR6166481_sub_1.fastq.gz
