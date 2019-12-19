#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N weak_scalability_TEST_w_20_nodes_openmp_pi
#PBS -l walltime=00:05:00
cd $HOME/FHPC_2019-2020/Workspace_3
Var=time_execution_weak_mandelbrot.csv

rm $Var
 touch $Var
 echo "N;p;time" > $Var

 M=1000000
 NSHOTS=10

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
 N=$(($M*$procs))
        avg=0;
 	for (( i=0; i<=$NSHOTS; i=i+1 )) 
        do
 		export OMP_NUM_THREADS=$procs
		echo "Execution $i for p=$procs"
		./openmp_mandelbrot $N $N -2 2 2 -2 1000 
		done
 done

