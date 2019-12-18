
#PBS -l nodes=1:ppn=20
 #PBS -l walltime=00:05:00
#PBS -N execution test for parts
 cd $HOME/FHPC_2019-2020/Workspace_2/pi_code_revisited/mpi_pi_code
module load openmpi 

Var=execution_times/mpi_walltimes.csv
 touch $Var
 echo "N,times" > $Var

 N=50000000
 NSHOTS=10

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
 		mpirun -np 20 ./mpi_pi $(($N*$procs)) >> $Var 

 done
