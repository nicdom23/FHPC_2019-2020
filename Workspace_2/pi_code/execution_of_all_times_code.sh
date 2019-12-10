#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N strong_scalability_TEST_w_20_nodes_mpi_pi
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code
export OMP_NUM_THREAD=20

Var=parts_results/elapsedtime_openmpi.csv
Var2=parts_results/walltime_openmpi.csv
touch $Var
touch $Var2
 echo "N;time" > $Var
 echo "N;time" > $Var2
 N=50000000
 NSHOTS=10

 for procs in 1 2 4 6 8 10 12 14 16 18 20
 do
        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 		export OMP_NUM_THREADS=20
		echo "Execution $i for p=$procs"
		#/usr/bin/time -f "buuuh %E" ./array_sum $N
		realtime=$( /usr/bin/time -f "buuuh$procs  %E" ./openmp_pi $(($N*$procs)) 2>&1 | grep buuuh$procs | cut -d' ' -f2) 
		echo $realtime
		realminutes=$(( $(echo $realtime | cut -d':' -f1)*60 ))
		realseconds=$(echo $realtime | cut -d':' -f2)
 		avg=$( echo "scale=4; $avg+$realminutes+$realseconds" | bc -l ) 
		echo "     procs " $procs " avg = " $avg 
 	done
        echo -n "avg time for procs " $procs " : "
        echo "scale=4; $avg/($NSHOTS+1)" | bc
        
        echo -n $(($N*$procs))"," >> $Var
        echo "scale=4; $avg/($NSHOTS+1)" | bc >> $Var
 done

