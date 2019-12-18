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
  // coordinates
  double x, y ;

  // number of points inside the circle
  long long int M, local_M ; 
  double pi ;
   
  // times 
  double start_time, end_time;   
  int myid , numprocs , proc ;
  MPI_Status status;
  MPI_Request request;
  // master process
  int master = 0;
  int tag = 123;

  MPI_Init(&argc,&argv);
  MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
  MPI_Comm_rank(MPI_COMM_WORLD,&myid);

  printf("hello from %d of %d ",myid,numprocs);

 
// take time of processors after initial I/O operation

  // initialize random numbers  // seed the number gene
    // take a point P(x,y) inside the unit square
      
    // check if the point P(x,y) is inside the circl //if I am the master process gather results from others
      // for all the slave processes send results to the master /

//    printf ( " Processor %d sending results = %llu to master process \n", myid, local_M) ;
//    int time_to_sle
  MPI_Finalize() ; // let MPI finish up /

}
