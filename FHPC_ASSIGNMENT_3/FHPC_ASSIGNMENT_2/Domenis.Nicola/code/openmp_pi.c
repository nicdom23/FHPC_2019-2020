#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <omp.h>
#define SEED 35791246
#ifdef OUTPUT
#define PRINTF(...) printf(__VA_ARGS__)
#else
#define PRINTF(...)
#endif


int main ( int argc , char *argv[ ] )
{
   long long int M =0 ;
  int size; 
  double pi ;
  double start_time_1, end_time_1,start_time_2,end_time_2;   
  long long int N;
if ( argc <=1) {
    fprintf (stderr , " Usage : %s number_of_iterations \n", argv[0] ) ;
    exit(-1) ;
  }

int myid , numprocs ;
#pragma omp parallel
{

    start_time_1 = omp_get_wtime();
    numprocs= omp_get_num_threads();
    myid = omp_get_thread_num(); 

	long long int local_M;
	double x, y;
	
	size =atoll(argv[1]);
	N = size /numprocs;

	unsigned int myseed=(SEED*(myid+1)) ; 
	local_M=0;
	long long int i;  


//initialization and estmation of the circle's points
#pragma omp parallel for reduction(+:local_M) 
for (i=0; i<N ; i++) {  
    x = rand_r(&myseed)/(double)RAND_MAX; 
    y = rand_r(&myseed)/(double)RAND_MAX;    
	if ((x*x + y*y)<1)
      local_M++;
	}

end_time_1=omp_get_wtime();
start_time_2= omp_get_wtime();
#pragma omp atomic
M += local_M ;

end_time_2=omp_get_wtime();
 
}

//print for the comparison with mpi_pi.c
PRINTF ( "problem size:%d , time execution of points estimation:%10.8f , time execution of total sum:%10.8f \n",size,end_time_1 - start_time_1, end_time_2 - start_time_2 ) ;
//print for walltime estimation
PRINTF ( "walltime of execution: %10.8f \n",end_time_2 - start_time_1 ) ;

pi = 4.0*M/(N*numprocs) ;
  PRINTF ( "\n # of trials = %llu , estimate of pi is %1.9f \n", N*numprocs, pi ) ;

 
return 0;
}
