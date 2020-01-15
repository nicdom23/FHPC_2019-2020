#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N strong_scalability_on_mandelbrot
#PBS -l walltime=00:20:00
cd $HOME/FHPC_2019-2020/Workspace_3

<<<<<<< HEAD
VAR=results/time_execution_strong_mandelbrot_no_sched_no_collapse.csv
=======
VAR=results/time_execution_strong_mandelbrot.csv
>>>>>>> 169f038e270b9a7f602f0270cedec879ea919a1b

rm $VAR
 touch $VAR
 echo "N,p,time" > $VAR

 N=10000
 NSHOTS=1

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 		export OMP_NUM_THREADS=$procs
		echo "Execution $i for p=$procs"
		
		#/usr/bin/time -f "buuuh %E" ./parallel_mandelbrot $N $N -2 2 2 -2 1000		
		realtime=$( /usr/bin/time -f "buuuh %E" ./parallel_mandelbrot $N $N -2 -2 2 2 100 2>&1 | grep buuuh | cut -d' ' -f2) 
		realminutes=$(( $(echo $realtime | cut -d':' -f1)*60 ))
		realseconds=$(echo $realtime | cut -d':' -f2)
 		avg=$( echo "scale=4; $avg+$realminutes+$realseconds" | bc -l ) 
		echo "     procs " $procs " avg = " $avg 
 	done
        echo -n "avg time for procs " $procs " : "
        echo "scale=4; $avg/($NSHOTS+1)" | bc
        
        echo -n $N","$procs"," >> $VAR
        echo "scale=4; $avg/($NSHOTS+1)" | bc >> $VAR
 done

