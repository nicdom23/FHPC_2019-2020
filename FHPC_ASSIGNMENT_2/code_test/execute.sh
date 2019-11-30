#!/bin/bash
#PBS -l nodes=5:ppn=20
#PBS -N test_w/nodes=5:ppn=20
#PBS -l walltime=00:01:00

cd $HOME/FHPC_2019-2020/FHPC_ASSIGNMENT_2/code_tes
/usr/bin/time ./hello_openmp -> results_hello.txt 
