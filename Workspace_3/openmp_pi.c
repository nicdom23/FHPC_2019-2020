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
  int n_x,n_y
  double n_x n_y x_L y_L x_R y_R;   
  long long int I_max
if ( argc <=1) {
    fprintf (stderr , " Usage : %s n_x n_y x_L y_L x_R y_R I_max \n", argv[0] ) ;
    exit(-1) ;
  }
n_x = atoll(argv[1]);
n_y= atoll(argv[2]);
x_L= atoll(argv[3]);
y_L= atoll(argv[4]);
x_R= atoll(argv[5]);
y_R = atoll(argv[6]);
I_max= atoll(argv[7]);

short int matrix [n_x][n_y];

for(int i=0;i<n_x;i++)
	for(int j=0;j<n_y;j++){
		matrix[i][j]= 0;
	}
int myid , numprocs ;
#pragma omp parallel
{

      numprocs= omp_get_num_threads();
      myid = omp_get_thread_num();

double c_r, c_i;
double delta_x = (x_R-x_L)/n_x;
double delta_y = (y_R-y_L)/n_y;
for(int i=0;i<n_x;i++)
        for(int j=0;j<n_y;j++){
		

		c_r=x_L+(i*delta_x);
		c_i= y_l+(j*delta_y);
		
		double z_r=0;
		double z_i=0;
		int counter = 0;
		for(;counter < I_max;counter++;)
		{
			z_r= z_r*z_r-z_i*z_i + c_r
			z_i=2*z_r*z_i+c_i
			counter ++;
			if(sqrt(z_r*z_r+z_i+z_y)>2{
                matrix[i][j]= counter;
		break
		}
 		}
}

 	
return 0;
}
