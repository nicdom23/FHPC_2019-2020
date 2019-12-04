#!/bin/bash
#PBS -l nodes=3:ppn=17
#PBS -N touch_by_ALL_TEST_w_3cores_51_nodes
#PBS -l walltime=00:01:00
cd $HOME/FHPC_2019-2020/Workspace_2


gcc -fopenmp -std=gnu99 -o touch_by_all 04_touch_by_all.c

unset OMP_NUM_THREADS
/usr/bin/time ./touch_by_all 1000000000 -> results/ex2on3nodesand51cores.txt
 
