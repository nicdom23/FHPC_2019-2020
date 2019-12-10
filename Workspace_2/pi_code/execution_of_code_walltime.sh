#PBS -l walltime=00:05:00
#PBS -l nodes=1:ppn=20
#PBS -N collecting_walltime

cd $HOME/FHPC_2019-2020/Workspace_2/pi_code

export OMP_NUM_THREADS=20
Var=parts_results/list_of_walltime_execution_of_code_openmp.csv
touch $Var
 echo "N;time" > $Var

 M=50000000
 NSHOTS=10

 for size in 1 2 4 6 8 10 12 14 16 18 20
 do 
  N=$(($M*$size))
		            ./openmp_pi $N >>$Var                  
done
