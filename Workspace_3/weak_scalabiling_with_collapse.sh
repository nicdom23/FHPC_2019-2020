#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N no_sch_collapse_weak_scalability_on_mandelbrot_lower_N
#PBS -l walltime=01:00:00
cd $HOME/FHPC_2019-2020/Workspace_3
Var=results/time_execution_weak_mandelbrot_collapse_no_sched.csv

rm $Var
 touch $Var
 echo "N,p,time" > $Var


 M=1000
 NSHOTS=1

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
 N=$(($M*$procs))
        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 		export OMP_NUM_THREADS=$procs
		echo "Execution $i for p=$procs"
               # /usr/bin/time -f "buuuh %E" ./parallel_mandelbrot $N $N -2 2 2 -2 100

		realtime=$( /usr/bin/time -f "buuuh %E" ./parallel_mandelbrot_collapse $N $N -2 -2 2 2 100 2>&1 | grep buuuh | cut -d' ' -f2) 
		#echo realtime $realtime
		realminutes=$(( $(echo $realtime | cut -d':' -f1)*60 ))
		realseconds=$(echo $realtime | cut -d':' -f2)
 		avg=$( echo "scale=4; $avg+$realminutes+$realseconds" | bc -l ) 
		echo "     procs " $procs " avg = " $avg 
 	done
        echo -n "avg time for procs " $procs " : "
        echo "scale=4; $avg/($NSHOTS+1)" | bc
       
        echo -n $N","$procs"," >> $Var
        echo "scale=4; $avg/($NSHOTS+1)" | bc >> $Var
 done

