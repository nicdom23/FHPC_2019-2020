#include <omp.h>
#include <stdio.h>

int main(){
#pragma omp parallel
{
printf("hello world from process: %d \n", omp_get_thread_num());

}
return 0;
}
