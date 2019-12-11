
#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N mpi_pi_comparison_Test
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code/mpi_pi_code
VAR=compare/mpi_pi_execution_comparison.csv
 module load openmpi
rm $VAR
 touch $VAR
 echo "N;p;time" > $VAR


 M=1000000
 NSHOTS=10

 for size in 1 10 20 30 70 100 150 500 1000 1500 3000
 do

 N=$(($M*$size))
 procs=20 

        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 		echo "Execution $i for p=$procs"
		realtime=$( /usr/bin/time -f "buuuh %E" mpirun -np $procs mpi_pi $N 2>&1 | grep buuuh | cut -d' ' -f2) 
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
