
The file openmp_pi.c has been run on the Ulysses cluster and 
has been compiled with GCC version 4.4.7
using the command line

gcc -fopenmp -DOUTPUT openmp_pi.c -o openmp_pi

then it has been executed as

./openmp_pi 1000000000

and the output was:

problem size:1000000000 , time execution of points estimation:2.40374017 , time execution of total sum:0.00000019 
walltime: 2.40374052 

 # of trials = 999999996 , estimate of pi is 3.141607713