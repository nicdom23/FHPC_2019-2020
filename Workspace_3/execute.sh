#!/bin/bash
#PBS -l nodes=3:ppn=10
#PBS -N touch_by_ALL_TEST_w_30_nodes
#PBS -l walltime=00:01:00
cd $HOME/FHPC_2019-2020/Workspace_3

/usr/bin/time ./serial_mandelbrot 100000 100000 -2 -2 2 2 100000
 
