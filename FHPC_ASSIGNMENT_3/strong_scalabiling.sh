 rm time_executions.csv
 touch time_executions.csv
 echo "N;p;time" > time_executions.csv
 
 N=5000000000

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
        avg=0;
 	for (( i=0; i<=10; i=i+1 )) 
        do
 		#echo "Execution $i for p=$procs"
		time=$(mpirun -np ${procs} sumN_comm_performance.x $N | grep walltime  | gawk 'BEGIN {max=0} {if($7>max) max=$7} END{print max}') 
		#echo "       " $procs $i $time $avg               
 		avg=$( echo "scale=4; $avg+$time" | bc -l )  
 	done
        echo -n "avg time for procs " $procs " : "
        echo "scale=4; $avg/(i+1)" | bc

        echo -n $N";"$procs";" >> time_executions.csv
        echo "scale=4; $avg/(i+1)" | bc >> time_executions.csv

 done
