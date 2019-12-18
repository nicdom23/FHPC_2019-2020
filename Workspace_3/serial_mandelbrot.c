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
  int n_x,n_y;
  double x_L, y_L, x_R, y_R;   
  long long int I_max;
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
	for(int j=0;j<n_y;j++)
		matrix[i][j]= 0;


double c_r, c_i;
double delta_x = (x_R-x_L)/n_x;
double delta_y = (y_R-y_L)/n_y;


for(int i=0;i<n_x;i++)
        for(int j=0;j<n_y;j++)
	{	
		
		
		c_r=x_L+(i*delta_x);
		c_i= y_L+(j*delta_y);
		double z_r=0;
		double z_i=0;
		int counter = 0;
		for(;counter < I_max && sqrt(z_r*z_r+z_i*z_i) < 2;counter++)
			{
			double d=sqrt(2);
			z_r= z_r*z_r-z_i*z_i + c_r;
			z_i=2*z_r*z_i+c_i;
			counter ++;
			}
		if (counter<I_max) matrix[i][j] = counter;	
		
	}	
		
	//printMatrix(matrix,n_x,n_y);

	for(int i=0;i<n_x;i++){
		printf("\n");
		for(int j=0;j<n_y;j++)
			printf("%d ",matrix[i][j]);
 		}
return 0;
}

/*
void printMatrix(int *matrix, int n_rows, int n_columns)
	{  for(int i=0;i<n_rows;i++){
		printf("\n");
		for(int j=0;j<n_columns;j++)
			printf("%d ",matrix[i][j]);
	
		}

	}*/
/*double module(int real,int imag){
	return sqrt(real*real+imag*imag);
	}*/
