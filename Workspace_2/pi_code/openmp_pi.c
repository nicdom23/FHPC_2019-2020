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
  int S; 
  double pi ;
  double start_time, end_time,start_time_1,end_time_1;   
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
      
long long int local_M ;
double x, y ;
	
	
	myid = omp_get_thread_num();
	printf("hello from thread %d from %d \n",myid,numprocs);
	S =atoll(argv[1]);
	N = S /numprocs;
      
  unsigned int myseed=(SEED*(myid+1)) ; 
  local_M=0;
  long long int i;  

/*
//initialization and estmation of the parallel points
#pragma omp parallel for reduction(+:local_M) 
for (i=0; i<N ; i++) {  
    x = rand_r(&myseed)/(double)RAND_MAX; 
    y = rand_r(&myseed)/(double)RAND_MAX;    
	if ((x*x + y*y)<1)
      local_M++;
	}

end_time_1=omp_get_wtime();
start_time = omp_get_wtime();
#pragma omp atomic
M += local_M ;

end_time=omp_get_wtime();
 
}

//print for the comparison with mpi_pi.c
PRINTF ("problem size, points estimation time, total sum time\n");
PRINTF ( "%d , %10.8f , %10.8f \n",S,end_time_1 - start_time_1, end_time - start_time ) ;
//print for walltime estimation
PRINTF("Walltime");
PRINTF ( " %10.8f \n",end_time - start_time_1 ) ;
pi = 4.0*M/(N*numprocs) ;
  PRINTF ( "\n # of trials = %llu , estimate of pi is %1.9f \n", N*numprocs, pi ) ;
*/
} 	
return 0;
}
