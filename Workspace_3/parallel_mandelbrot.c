#include <stdlib.h>
#include <stdio.h>

#include <math.h>
#include<omp.h>
void write_pgm_image( void *image, int maxval, int xsize, int ysize, const char *image_name);
//creates the pgm image containing the fractal

double module(int real,int imag);
//calculates the module of a complex number

void printMatrix(char *matrix, int n_rows, int n_columns);
//prints the given matrix

char isMandelbrot(double c_r,double c_i,int I_max);
//identifies if the given complex number belongs to the mandelbrot set
//Returns 0 if the point belongs to the mandelbrot set
//Returns the number of iterations to reach module(c_r,c_i)>2 if the points doesn't belong to the mandelbrot set

int main ( int argc , char *argv[ ] )
{
//Initialization of variables
  long long int n_x,n_y;
  double x_L, y_L, x_R, y_R;   
  long long int I_max;

//input check
if ( argc <=7) {
    fprintf (stderr , " Usage : %s int n_x-int n_y-double x_L-double y_L-double x_R-double y_R-int I_max \n", argv[0] ) ;
    exit(-1) ;
  }
printf("data collection");
//data collection from input

sscanf(argv[1], "%lld", &n_x);
sscanf(argv[2], "%lld", &n_y);
sscanf(argv[3], "%lf", &x_L);
sscanf(argv[4], "%lf", &y_L);
sscanf(argv[5], "%lf", &x_R);
sscanf(argv[6], "%lf", &y_R);
sscanf(argv[7], "%lld", &I_max);
printf("data collected");
//check on collected data
if ( y_R>=y_L|| x_L>=x_R) {
    fprintf (stderr , " The first point must be the top left point of the area.\n The second point must be the bottom right point of the area.  \n") ;
    exit(-1) ;
  }
//creating matrix
char *matrix = (char*)malloc(n_x * n_y * sizeof(char));
printf("matrix made");
//calculating horizontal and vertical offset
double delta_x = (x_R-x_L)/n_x;
double delta_y = (y_L-y_R)/n_y;

//debugging prints
//printf("x_L %f,y_L %f ,x_R %f,y_R %f\n",x_L,y_L,x_R,y_R);

//printf("x_r-x_l%f, y_l-y_r%f \n",x_R-x_L,y_L-y_R);

//printf("delta_x%f,deltaY: %f \n", delta_x,delta_y);
#pragma omp parallel for
for(int i=0;i<n_x;i++){
	//printf("\n*************\n");
        for(int j=0;j<n_y;j++)
	{	
		double c_r=x_L+(j*delta_x);
		double c_i= y_L-(i*delta_y);
		//printf("%5.3f + i %5.3f :",c_r,c_i);
	        int offset= i*n_y+j;					
		matrix[offset]= isMandelbrot(c_r,c_i,I_max);
	}	
	}
	//printMatrix(matrix,n_x,n_y); //uncomment to print the matrix
//produce image
write_pgm_image(matrix,50,n_x,n_y,"parallel_mandelbrot_image");

return 0;
}

char isMandelbrot(double c_r,double c_i,int I_max){//verifies if the element belongs to the mandelbrot set
		double z_r=0;
		double z_i=0;
		int counter = 0;
		char to_return;
		for(;counter < I_max && module(z_r,z_i) < 2;counter++)
			{
			double z_r_1= z_r*z_r-z_i*z_i + c_r;
			double z_i_1=2*z_r*z_i+c_i;
			z_r=z_r_1;
			z_i=z_i_1;
			counter ++;
			}
		if (counter<I_max) to_return=counter;//does not belong to the mandelbrot set
		else to_return = 0;//does belong to the mandelbrot set
		return to_return;
}


void printMatrix(char *matrix, int n_rows, int n_columns)
	{  for(int i=0;i<n_rows;i++)
		{printf("\n");
		for(int j=0;j<n_columns;j++){
			int offset=i*n_columns+j;
			printf("%d ",matrix[offset]);
			}
		}
        }

double module(int real,int imag){
	return sqrt(real*real+imag*imag);
	}

void write_pgm_image( void *image, int maxval, int xsize, int ysize, const char *image_name)
{
  FILE* image_file; 
  image_file = fopen(image_name, "w"); 
  
  int color_depth = 1+((maxval>>8)>0);       // 1 if maxval < 256, 2 otherwise

  fprintf(image_file, "P5\n%d %d\n%d\n", xsize, ysize, maxval);
  
  // Writing file
  fwrite( image, color_depth, xsize*ysize, image_file);  

  fclose(image_file); 
  return ;

  
}
