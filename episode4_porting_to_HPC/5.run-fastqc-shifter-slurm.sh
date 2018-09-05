#!/bin/bash -l

#SBATCH --account=<your-pawsey-project>
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE
#SBATCH --job-name=fastqc

module load shifter

srun_cmd="srun --export=all"
fastqc_cont=quay.io/biocontainers/fastqc:0.11.7--4

cp -p ../data_files/SRR6166481_sub_1.fastq.gz .

# /group and /scratch are visible on Pawsey HPC systems
$srun_cmd shifter run $fastqc_cont fastqc -o . SRR6166481_sub_1.fastq.gz
