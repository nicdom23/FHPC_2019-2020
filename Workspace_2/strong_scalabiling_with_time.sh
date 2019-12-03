 rm time_executions.csv
 touch time_executions.csv
 echo "N;p;time" > time_executions.csv

 N=500000000
 NSHOTS=10

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 		#echo "Execution $i for p=$procs"
		realtime=$( /usr/bin/time -f "buuuh %E" mpirun -np ${procs} sumN_comm_performace.x $N 2>&1 | grep buuuh | cut -d' ' -f2) 
		realminutes=$(( $(echo $realtime | cut -d':' -f1)*60 ))
		realseconds=$(echo $realtime | cut -d':' -f2)
 		avg=$( echo "scale=4; $avg+$realminutes+$realseconds" | bc -l ) 
		#echo "     procs " $procs " avg = " $avg 
 	done
        echo -n "avg time for procs " $procs " : "
        echo "scale=4; $avg/($NSHOTS+1)" | bc
        
        echo -n $N";"$procs";" >> time_executions.csv
        echo "scale=4; $avg/($NSHOTS+1)" | bc >> time_executions.csv
 done
