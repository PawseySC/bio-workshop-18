#!/bin/bash

mummer4_cont=quay.io/biocontainers/mummer4:4.0.0beta2--pl526hfc679d8_3
run_flags="--rm -v $(pwd):/data -w /data"

# container commands here
#

# assuming gnuplot is installed in the machine. if not, the following will fail and no image file will be created by mummer
# you can install gnuplot on Ubuntu using "sudo apt-get install gnuplot"
gnuplot SRR6166481_sub_mummer.gp
