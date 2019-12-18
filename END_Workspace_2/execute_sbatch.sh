#!/bin/bash
#SBATCH -N 1
#SBATCH -n 10
#SBATCH --job-name=test_on_touch_by_all_on_10_nodes
#SBATCH -t 00:01:00
cd $HOME/FHPC_2019-2020/Workspace_2

gcc -fopenmp -std=gnu99 -o touch_by_all 04_touch_by_all.c

unset OMP_NUM_THREADS
/usr/bin/time ./touch_by_all 1000000000 -> results/ex1on1nodes10cores.txt
 
