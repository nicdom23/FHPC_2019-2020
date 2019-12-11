
#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N weak_scalability_TEST_w_1_nodes_openmp_pi
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code/mpi_pi_code

module load openmpi
Var=parts_results/execution_code_mpi.csv
 touch $Var
 echo "N;time" > $Var

 N=50000000
 NSHOTS=10

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
        avg=0
 		echo "Execution $i for p=$procs"
		realtime=$( /usr/bin/time -f "buuuh %E" mpirun -np 20 ./mpi_pi $(($N*$procs)) 2>&1 | grep buuuh | cut -d' ' -f2) 
		realminutes=$(( $(echo $realtime | cut -d':' -f1)*60 ))
		realseconds=$(echo $realtime | cut -d':' -f2)
 		avg=$( echo "scale=4; $avg+$realminutes+$realseconds" | bc -l ) 
		echo "     procs " $procs " avg = " $avg 
              
       
        
        #echo -n $(($N*$procs))";" >> $VAR
 	#echo $avg >>$VAR
 done
