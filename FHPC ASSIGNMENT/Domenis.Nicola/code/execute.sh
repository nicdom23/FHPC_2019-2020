#!/bin/bash
#PBS -l nodes=5:ppn=20
#PBS -N pirun_elapsed_weak_scaling
#PBS -l walltime=00:01:00
module load openmpi

cd $HOME/pi_calculus

mpicc mpi_pi.c -o mpi_pi.x
for n in 1 2 4 8 16 32 64
do
/usr/bin/time mpirun -np ${n} ./mpi_pi.x 10000000  > elapsed_strong_scaling${n}growing.txt
done 
