#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N strong_scalability_TEST_w_20_nodes_mpi_pi
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_2/pi_code_strong_scalability

VAR=strong_scalability/strong_scalability_walltime_openmp.csv

rm $VAR
 touch $VAR
 echo "N,p,time" > $VAR

 N=1000000000
 NSHOTS=5

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
 		export OMP_NUM_THREADS=$procs
		echo "Execution $i for p=$procs"
		#/usr/bin/time -f "buuuh %E" ./array_sum $N
		./openmp_pi $N >> $VAR		
 done

