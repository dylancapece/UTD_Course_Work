#!/bin/bash
#SBATCH -p COMETS
#SBATCH -N 4
#SBATCH -t 4:00:00
#SBATCH --exclusive
#SBATCH --ntasks-per-node=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=dsc160330@utdallas.edu
export OMP_NUM_THREADS=1
echo "OMP 1 CORES"
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
export OMP_NUM_THREADS=4
echo "OMP 4 CORES"
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
export OMP_NUM_THREADS=9
echo "OMP 9 CORES"
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
export OMP_NUM_THREADS=16
echo "OMP 16 CORES"
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
mpirun -np 4 /home/dsc160330/Project6/pgm3.mpi
./laplace
