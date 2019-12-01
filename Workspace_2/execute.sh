#!/bin/bash
#PBS -l nodes=3:ppn=10
#PBS -N touch_by_ALL_TEST_w_two_nodes
#PBS -l walltime=00:01:00
cd $HOME/FHPC_2019-2020/Workspace_2

gcc -fopenmp -std=gnu99 -o touch_by_all 04_touch_by_all.c

export OMP_NUM_THREADS=20
/usr/bin/time ./touch_by_all 1000000000 -> result/on3nodes30cores.txt
 
