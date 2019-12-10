
#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N mpi_elapsed_times
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code_revisited/mpi_pi_code
VAR=execution_times/mpi_elapsed_time.cs

module load openmpi 
rm $VAR
 touch $VAR
 echo "N;time" > $VAR

 M=500000000
 NSHOTS=1

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
	N=$(($procs*$M)) 	
       avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 	
		echo "Execution $i for p=$procs"
		realtime=$( /usr/bin/time -f "buuuh %E" mpirun -np 20 mpi_pi $N 2>&1 | grep buuuh | cut -d' ' -f2) 
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
