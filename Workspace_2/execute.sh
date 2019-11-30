#!/bin/bash
#PBS -l nodes=1:ppn=10
#PBS -N touch_by_ALL_TEST
#PBS -l walltime=00:01:00
cd $HOME/FHPC_2019-2020/Workspace_2

gcc -fopenmp -std=gnu99 -o touch_by_all 04_touch_by_all.c

/usr/bin/time ./touch_by_all 100 -> result/on10cores.txt
 
