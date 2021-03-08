#!/bin/bash
#SBATCH -p COMETS
#SBATCH -N 4
#SBATCH -t 4:00:00
#SBATCH --exclusive
#SBATCH --ntasks-per-node=16
#SBATCH --mail-type=ALL
#SBATCH --mail-user=dsc160330@utdallas.edu
export OMP_NUM_THREADS=1
echo "mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi"
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 1 /home/dsc160330/Project2/pgm2.mpi
echo "mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi"
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 2 /home/dsc160330/Project2/pgm2.mpi
echo "mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi"
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 3 /home/dsc160330/Project2/pgm2.mpi
echo "mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi"
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
mpirun -np 4 /home/dsc160330/Project2/pgm2.mpi
./laplace
