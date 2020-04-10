#!/bin/bash
#SBATCH --job-name=qe
#SBATCH --output=qe.out 
#SBATCH --error=qe.err 
#SBATCH -N 1 # node count
#SBATCH --ntasks-per-node=16
#SBATCH -t 24:00:00 
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

module load intel/19.0/64/19.0.1.144
module load intel-mkl/2019.1/1/64 
module load intel-mpi/intel/2018.3/64 

export TITLE=$(basename `pwd`) # Graphene
export EXAMPLE=$(cd ../; pwd)

#export ESPRESSO_PSEUDO=$EXAMPLE/$TITLE/UPF
#export ESPRESSO_TMPDIR=$EXAMPLE/$TITLE/TMP
#export ESPRESSO_D3DIR=$EXAMPLE/$TITLE/TMP3
#export ESPRESSO_FILDRHO_DIR=$EXAMPLE/$TITLE/FILDRHO
#mkdir -p $ESPRESSO_D3DIR

echo ================================================================

export ESPRESSO=/home/sh33/espresso+d3q_mymod
export ESPRESSO_BIN=$ESPRESSO/bin

bin="$ESPRESSO_BIN"
pref="mpirun -np 16 "  # e.g. "mpirun -np 4 "
post=" "  # e.g. -npool 4

echo "doing SMA thermal conductivity calculation"
#$pref $bin/d3_tk_mymod.x -in input.getA.TK-cgp > output.getA.TK-cgp
srun $bin/d3_tk.x -in input.TK-cgp > output.TK-cgp

echo "end of calculation"


