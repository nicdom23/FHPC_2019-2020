
#PBS -l nodes=1:ppn=20
 #PBS -l walltime=00:05:00
#PBS -N execution test for parts
 cd $HOME/FHPC_2019-2020/Workspace_2/pi_code_strong_scalability/mpi_pi_code
module load openmpi 

Var=strong_scaling_mpi/strong_scaling_walltime.csv
 touch $Var
 echo "N,p,time" > $Var

 N=1000000000

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
 		mpirun -np $procs ./mpi_pi $N >> $Var 

 done
