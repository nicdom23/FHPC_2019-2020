##readme
n.txt contains a number that refers to the size of the problem


File sumNumbers_mpi.c is executed as

$ module load openmpi
$ mpicxx sumNumbers_mpi.cc -o sumNumbers_mpi.xx
$ time mpirun -np 10 ./sumNumbers_mpi.xx < n.txt

The code adresses the cases where the number of processors 
does not divide
perfectly the problem size.
The master node has the task to compute the remainder elements 
before starting the slave processors.

File sumNumbers_coll.c is executed as

$ module load openmpi
$ mpicxx sumNumbers_coll.cc -o sumNumbers_coll.xx
$ time mpirun -np 10 ./sumNumbers_coll.xx < n.txt

the program repeats the sumNumbers_mpi.cc behaviour, but uses
collective functions