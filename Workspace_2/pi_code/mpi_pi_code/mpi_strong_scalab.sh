
#!/bin/bash
#PBS -l nodes=19:ppn=1
#PBS -N weak_scalability_TEST_w_1_nodes_openmp_pi
#PBS -l walltime=00:05:00
module load openmpi
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code/mpi_pi_code
VAR=results/time_executions_20_node.csv
 
rm $VAR
 touch $VAR
 echo "N;p;time" > $VAR

 N=1000000000
 NSHOTS=10

 for procs in 20 
 do
        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 		echo "Execution $i for p=$procs"
		realtime=$( /usr/bin/time -f "buuuh %E" mpirun -np ${procs} mpi_pi $N 2>&1 | grep buuuh | cut -d' ' -f2) 
		realminutes=$(( $(echo $realtime | cut -d':' -f1)*60 ))
		realseconds=$(echo $realtime | cut -d':' -f2)
 		avg=$( echo "scale=4; $avg+$realminutes+$realseconds" | bc -l ) 
		echo "     procs " $procs " avg = " $avg 
 	done
        echo -n "avg time for procs " $procs " : "
        echo "scale=4; $avg/($NSHOTS+1)" | bc
        
        echo -n $N";"$procs";" >> $VAR
        echo "scale=4; $avg/($NSHOTS+1)" | bc >> $VAR
 done
