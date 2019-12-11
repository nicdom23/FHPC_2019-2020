
#PBS -l nodes=1:ppn=20
 #PBS -l walltime=00:05:00
#PBS -N execution test for parts
 cd $HOME/FHPC_2019-2020/Workspace_2/pi_code/
 Var=parts_results/execution_parts.csv
 touch $Var
 echo "N;time_points;time_sum" > $Var

 N=50000000
 NSHOTS=10

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
 		./openmp_pi $(($N*$procs)) >> $Var 

 done
