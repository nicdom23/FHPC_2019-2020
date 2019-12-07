#include <stdio.h>
#include <omp.h>

int main(){
#pragma omp parallel 
{
int my_id = omp_get_thread_num();
int totprocs = omp_get_num_threads();

printf("HELLo from proc %d of %d\n",my_id,totprocs);
}


return 0;
}
