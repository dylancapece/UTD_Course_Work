#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU
#SBATCH --ntasks-per-node 1
#SBATCH -t 5:00:00
#SBATCH --gres=gpu:p100:2
#echo commands to stdout
set -x
#move to working directory
# this job assumes:
# - all input data is stored in this directory
# - all output should be stored in this directory
cd /pylon5/groupname/username/path-to-directory

#run GPU program
./mygpu
