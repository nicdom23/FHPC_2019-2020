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
      numprocs= omp_get_num_threads();
     
long long int local_M ;
double x, y ;
	
	
	myid = omp_get_thread_num();
	S =atoll(argv[1]);
	N = S /numprocs;
	//PRINTF("thread %d of %d \n",myid,numprocs);
 
  

  start_time_1 = omp_get_wtime();

  
  unsigned int myseed=(SEED*(myid+1)) ; 
  local_M=0;
  long long int i;  
#pragma omp parallel for reduction(+:local_M) 
for (i=0; i<N ; i++) {  
    x = rand_r(&myseed)/(double)RAND_MAX; 
    y = rand_r(&myseed)/(double)RAND_MAX;    
	if ((x*x + y*y)<1)
      local_M++;
 // PRINTF("local threads %lld from thread %d   \n",local_M,myid);
	}

end_time_1=omp_get_wtime();
start_time = omp_get_wtime();
#pragma omp atomic
//printf("M value = %lld + %lld = %lld",M ,local_M,M+local_M);
M += local_M ;

end_time=omp_get_wtime();


//PRINTF ( "\n # walltime on thread %i : %10.8f \n",myid, end_time - start_time ) ; 
}
PRINTF ( "\n%d ; %10.8f ; %10.8f \n",S,end_time_1 - start_time_1, end_time - start_time ) ;


//PRINTF ( "\n%d ; %10.8f ; %10.8f \n",S,end_time_1 - start_time_1, end_time - start_time ) ;
//PRINTF("N*numprocs= %lld,%d",N,numprocs);
//pi = 4.0*M/(N*numprocs) ;
 // PRINTF ( "\n # of trials = %llu , estimate of pi is %1.9f \n", N*numprocs, pi ) ;

 	
return 0;
}
