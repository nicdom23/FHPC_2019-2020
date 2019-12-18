#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N comparison_TEST_w_20_nodes_openmp_pi
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code
Var=compare/time_execution_for_comparison.csv

rm $Var
 touch $Var
 echo "N;time" > $Var

 N=1000000
 NSHOTS=10
 export OMP_NUM_THREADS=20
 for procs in 1 10 20 30 70 100 150 500 1000 1500 3000 
 do
        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 	
		echo "Execution $i for size=$(($procs*$N))"
		#/usr/bin/time -f "buuuh %E" ./array_sum $N
		realtime=$( /usr/bin/time -f "buuuh %E" ./openmp_pi $(($N*$procs)) 2>&1 | grep buuuh | cut -d' ' -f2) 
		echo -n "realtime :" $realtime
		realminutes=$(( $(echo $realtime | cut -d':' -f1)*60 ))
		realseconds=$(echo $realtime | cut -d':' -f2)
 		avg=$( echo "scale=4; $avg+$realminutes+$realseconds" | bc -l ) 
		echo "     size " $(($N*$procs)) " avg = " $avg 
 	done
        echo -n "avg time for size " $(($N*$procs)) " : "
        echo "scale=4; $avg/($NSHOTS+1)" | bc
        
        echo -n $(($N*$procs))";" >> $Var
        echo "scale=4; $avg/($NSHOTS+1)" | bc >> $Var
 done

