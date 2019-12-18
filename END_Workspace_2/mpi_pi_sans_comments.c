/*
 * Copyright (C) 2015 - 2016 Master in High Performance Computing
 *
 * Adapted from the net by  Giuseppe Brandino. 
 * Last modified by Alberto Sartori. 
 * Addedd time and promoted to long long all important variables
 */

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <mpi.h>
#define USE MPI
#define SEED 35791246

int main ( int argc , char *argv[ ] )
{
  
  double x, y ;

 
  long long int M, local_M ; 
  double pi ;
   
  
  double start_time, end_time;   
  int myid , numprocs , proc ;
  MPI_Status status;
  MPI_Request request;
  
  int master = 0;
  int tag = 123;

  MPI_Init(&argc,&argv);
  MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
  MPI_Comm_rank(MPI_COMM_WORLD,&myid);

  if ( argc <=1) {
    fprintf (stderr , " Usage : mpi -np n %s number_of_iterations \n", argv[0] ) ;
    MPI_Finalize() ;
    exit(-1) ;
  }

  long long int N = atoll(argv[1])/numprocs;

  start_time = MPI_Wtime();

  
  srand48(SEED*(myid+1)) ; 
  local_M=0;
  long long int i;
  for (i=0; i<N ; i++) {
    
    x = drand48(); 
    y = drand48();
      
   
    if ((x*x + y*y)<1)
      local_M++;
  }

  if (myid ==0) { 
    M = local_M ;
    for (proc=1; proc<numprocs ; proc++) {
      MPI_Recv(&local_M,1,MPI_LONG_LONG,proc,tag,MPI_COMM_WORLD,&status ) ;

      M += local_M ;
    }
    pi = 4.0*M/(N*numprocs) ;
    end_time=MPI_Wtime();
    printf ( "\n # of trials = %llu , estimate of pi is %1.9f \n", N*numprocs, pi ) ;
    printf ( "\n # walltime on master processor : %10.8f \n", end_time - start_time ) ;
  }
  else {   

    MPI_Ssend(&local_M , 1 ,MPI_LONG_LONG, master , tag ,MPI_COMM_WORLD) ;
    end_time=MPI_Wtime();
    printf ( "\n # walltime on processor %i : %10.8f \n",myid, end_time - start_time ) ;
  }

  MPI_Finalize() ; 

}
