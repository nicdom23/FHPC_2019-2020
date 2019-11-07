##readme
n.txt contains a number that refers to the size of the problem





File sumNumbers_mpi.c is executed as:

$ module load openmpi
$ mpicxx sumNumbers_mpi.cc -o sumNumbers_mpi.xx
$ time mpirun -np 10 ./sumNumbers_mpi.xx < n.txt




The code adresses the cases where the number of processors 
does not divide
perfectly the problem size.
The master node has the task to compute the remainder elements 
before starting the slave processors.





File sumNumbers_coll.c is executed as:

$ module load openmpi
$ mpicxx sumNumbers_coll.cc -o sumNumbers_coll.xx
$ time mpirun -np 10 ./sumNumbers_coll.xx < n.txt



the program repeats the sumNumbers_mpi.cc behaviour, but uses
collective functions



The execute file here included is just an example of 
the different bash script versions
that i used to calculate the different times of execution.
I used them to execute the jobs using the command:

$ qsub execute.sh

and then i exported the results on my local computer by using

$ scp ndomenis@frontend2.hpc.sissa.it:<file's adress> .

Then i used R to plot the data

plot(p,times,type="l")

which I did then export to latex to figure in the report.