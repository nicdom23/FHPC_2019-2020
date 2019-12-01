#!/bin/bash
#PBS -l nodes=2:ppn=10
#PBS -N touch_by_ALL_TEST_w_2cores_20_nodes
#PBS -l walltime=00:01:00
cd $HOME/FHPC_2019-2020/Workspace_2

gcc -fopenmp -std=gnu99 -o touch_by_all 04_touch_by_all.x
unset OMP_NUM_THREADS
/usr/bin/time ./touch_by_all 1000000000 -> result/ex2on2nodesand20cores.txt
 
