#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -N execution_test_on_mandelbrot
#PBS -l walltime=01:00:00
cd $HOME/FHPC_2019-2020/Workspace_3
 M=1000
 NSHOTS=1

 for procs in 1 2 4 6 8 10 12 14 16 18 20 
 do
 N=$M
 		export OMP_NUM_THREADS=$procs
		echo "Execution $i for p=$procs"
                ./parallel_mandelbrot_output $N $N -2 -2 2 2 100

 done

