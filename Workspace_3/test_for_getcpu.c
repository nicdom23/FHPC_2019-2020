#define _GNU_SOURCE
#include <utmpx.h>
#include<stdio.h>
int sched_getcpu(void);

int main(){
int cpu = sched_getcpu();
printf("we are in this cpu %d", cpu);

}
