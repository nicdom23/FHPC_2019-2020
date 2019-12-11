#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N omp_elapsed_time_calculation
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code_revisited

VAR=time_executions/omp_elapsed_time.csv
rm $VAR
 touch $VAR
 echo "N,p,time" > $VAR

 M=50000000
 NSHOTS=1

 for size in 1 2 4 6 8 10 12 14 16 18 20 
 do
	N=$(($M*$size))
        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 		export OMP_NUM_THREADS=20
		echo "Execution $i for p=20"
		#/usr/bin/time -f "buuuh %E" ./array_sum $N
		realtime=$( /usr/bin/time -f "buuuh %E" ./openmp_pi $N 2>&1 | grep buuuh | cut -d' ' -f2) 
		echo $realtime
		realminutes=$(( $(echo $realtime | cut -d':' -f1)*60 ))
		realseconds=$(echo $realtime | cut -d':' -f2)
 		avg=$( echo "scale=4; $avg+$realminutes+$realseconds" | bc -l ) 
		echo "     procs " $procs " avg = " $avg 
 	done
        echo -n "avg time for procs " $procs " : "
        echo "scale=4; $avg/($NSHOTS+1)" | bc
        
        echo -n $N",20," >> $VAR
        echo "scale=4; $avg/($NSHOTS+1)" | bc >> $VAR
 done

