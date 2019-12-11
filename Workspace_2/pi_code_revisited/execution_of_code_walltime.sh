#PBS -l walltime=00:05:00
#PBS -l nodes=1:ppn=20
#PBS -N collecting_walltime

cd $HOME/FHPC_2019-2020/Workspace_2/pi_code_revisited

export OMP_NUM_THREADS=20
Var=time_executions/omp_walltime_execution.csv
touch $Var
 echo "N;time" > $Var

 M=50000000
 NSHOTS=10

 for size in 1 2 4 6 8 10 12 14 16 18 20
 do 
  N=$(($M*$size))
		            ./openmp_pi $N >>$Var                  
done
