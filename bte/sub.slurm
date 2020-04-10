#!/bin/bash
#SBATCH --job-name=sheng
#SBATCH --output=sheng.out 
#SBATCH --error=sheng.err 
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 4:00:00
#SBATCH --mail-type=end

module load intel/19.0/64/19.0.3.199
module load intel-mpi/intel/2018.3/64
module load intel-mkl/2019.3/3/64 

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/installs/spglib/_build/
#mpirun -n 8 /home/sh33/installs/ShengBTE.alloy/ShengBTE
mpirun -n 8 /home/sh33/installs/ShengBTE/ShengBTE
