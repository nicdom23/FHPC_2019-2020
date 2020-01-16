#PBS -N run_mpi
#PBS -l walltime=00:01:00
#PBS -l nodes=1:ppn=20


cd $HOME/FHPC_2019-2020/D_1021/code/test4mpi
module load openmpi
mpirun -np 10 ./mpi_pi 10000
