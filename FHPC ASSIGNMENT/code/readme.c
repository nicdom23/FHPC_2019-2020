##readme

File sumNumbers_mpi.c is executed as

$ module load openmpi
$ mpicxx sumNumbers_mpi.cc -o sumNumbers_mpi.xx
$ time mpirun -np 10 ./sumNumbers_mpi.xx < n.txt

The code adresses the cases where the number of processors 
does not divide
perfectly the problem size.
The master node has the task to compute the remainder elements 
before starting the slave processors.