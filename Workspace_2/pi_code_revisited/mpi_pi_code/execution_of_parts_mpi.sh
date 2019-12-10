
#PBS -l nodes=1:ppn=20
 #PBS -l walltime=00:05:00
#PBS -N execution test for parts
 cd $HOME/FHPC_2019-2020/Workspace_2/pi_code/mpi_pi_code
module load openmpi 

Var=parts_results/execution_parts_mpi.csv
 touch $Var
 echo "N;time_points;time_sum" > $Var

 N=50000000
 NSHOTS=10

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
 		mpirun -np 20 ./mpi_pi $(($N*$procs)) >> $Var 

 done
