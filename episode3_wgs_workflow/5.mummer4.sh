#!/bin/bash

mummer4_cont=
run_flags=

# container commands here
#

# assuming gnuplot is installed in the machine. if not, the following will fail and no image file will be created by mummer
# you can install gnuplot on Ubuntu using "sudo apt-get install gnuplot"
gnuplot SRR6166481_sub_mummer.gp
