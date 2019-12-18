#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N strong_scalability_TEST_w_20_nodes_mpi_pi
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code

VAR=parts_results/couple_of_times.csv
rm $VAR
 touch $VAR
 echo "N,wall_time,elapsed_time" > $VAR

 M=50000000
 NSHOTS=5

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
	N=$(($M*$procs))  	

 		export OMP_NUM_THREADS=20
		#/usr/bin/time -f "buuuh %E" ./array_sum $N
		 /usr/bin/time -f "el_time %E" ./openmp_pi $N >> $VAR
		 

 done

