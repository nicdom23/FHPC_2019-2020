#include<stdio.h>
#include<stdlib.h>
#include<mpi.h>

int main(int argc,char**argv){

int array[10] = {1,2,3,4,5,6,7,8,9,10};

int size,rank;
MPI_init(&argc,&argv);
MPI_Comm_size(MPI_COMM_WORLD,&size);
MPI_Comm_rank(MPI_COMM_WORLD,&rank);



MPI_Finalize();
return 0;
}
