#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
int main(int argc , char *argv[ ]){

long long unsigned int n_x,n_y;

if(argc<3){printf("usage %s n_x n_y",argv[0]);
	    exit(-1);	}

sscanf(argv[1], "%llu", &n_x);
sscanf(argv[2], "%llu", &n_y);

printf("%llu * %llu = %llu is bigger than %llu",n_x,n_y,n_x*n_y,ULLONG_MAX);

if(n_x*n_y>ULLONG_MAX) printf("wrong input");
else printf("correct input");

//char *matrix = (char*)malloc(n_x*n_y*sizeof(char));
char *matrix = (char*)malloc(n_x*n_y*sizeof(char));
if (!matrix) { printf("Returned null array");
		perror("malloc arr"); exit(-1); };

int i=10,j=20;
unsigned long long int offset = n_y ;
matrix[10]='d';
printf("in table %c",matrix[10]);
//	matrix[offset]='d';
//printf("content is 'd'? --> %c in position %llu", matrix[offset],offset);
free(matrix);

return 0;
}
