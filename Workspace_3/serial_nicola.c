#include <stdlib.h>
#include <stdio.h>
#include <math.h>
void write_pgm_image( void *image, int maxval, int xsize, int ysize, const char *image_name);
double module(int real,int imag);
void printMatrix(int *matrix, int n_rows, int n_columns);
char isMandelbrot(double c_r,double c_i,int I_max);
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

char *matrix = (char*)malloc(n_x * n_y * sizeof(char));


double c_r, c_i;
double delta_x = (x_R-x_L)/n_x;
double delta_y = (y_L-y_R)/n_y;
printf("%f,%f", x_R,x_L);

printf("%f,%f", delta_x,delta_y);

for(int j=0;j<n_y;j++){
	printf("\n*************\n");
        for(int i=0;i<n_x;i++)
	{	
		c_r=x_L+(i*delta_x);
		c_i= y_L-(j*delta_y);
		printf("%5.2f + i %5.2f :",c_r,c_i);
	        int offset= j*n_x+i;					
		matrix[offset]= isMandelbrot(c_r,c_i,I_max);
	}	
	}
	//printMatrix(matrix,n_x,n_y);

	/*for(int i=0;i<n_x;i++){
		printf("\n");
		for(int j=0;j<n_y;j++){
			int offset= i*n_y+j;			
			printf("%d ",matrix[offset]);
			}
 		}*/
write_pgm_image(matrix,50,n_x,n_y,"mandelbrot_image");
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


void printMatrix(int *matrix, int n_rows, int n_columns)
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
