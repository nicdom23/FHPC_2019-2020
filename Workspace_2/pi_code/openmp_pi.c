#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <omp.h>
#define USE MPI
#define SEED 35791246


int main ( int argc , char *argv[ ] )
{
  long long int M =0 ; 
  double pi ;
  double start_time, end_time;   
  long long int N;
if ( argc <=1) {
    fprintf (stderr , " Usage : %s number_of_iterations \n", argv[0] ) ;
    exit(-1) ;
  }

int myid , numprocs ;
#pragma omp parallel// implicit(none) reserved(local_M) public(M)
{

long long int local_M ;
double x, y ;
	
	numprocs= omp_get_num_threads();
	myid = omp_get_thread_num();
	N = atoll(argv[1])/numprocs;
	printf("thread %d of %d \n",myid,numprocs);
 
  

  start_time = omp_get_wtime();

  
  unsigned int myseed=(SEED*(myid+1)) ; 
  local_M=0;
  long long int i;//   
#pragma omp parallel for  
for (i=0; i<N ; i++) {  
    x = rand_r(&myseed)/(double)RAND_MAX; 
    y = rand_r(&myseed)/(double)RAND_MAX;    
	if ((x*x + y*y)<1)
      local_M++;
  //printf("local threads %lld from thread %d   \n",local_M,myid);
}
#pragma omp atomic
//printf("M value = %lld + %lld = %lld",M ,local_M,M+local_M);
M += local_M ;


}
printf("N*numprocs= %lld,%d",N,numprocs);
pi = 4.0*M/(N*numprocs) ;
  printf ( "\n # of trials = %llu , estimate of pi is %1.9f \n", N*numprocs, pi ) ;

/*if (myid ==0) { 

    M = local_M ;
    for (proc=1; proc<numprocs ; proc++) {
     // MPI_Recv(&local_M,1,MPI_LONG_LONG,proc,tag,MPI_COMM_WORLD,&status ) ;

      M += local_M ;
    }
    
    end_time=omp_get_wtime();
  

  }//walltime on master
  else {   

    end_time=omp_get_wtime();

  }
 printf ( "\n # walltime on processor %i : %10.8f \n",myid, end_time - start_time ) ;
  
*/
	

}
