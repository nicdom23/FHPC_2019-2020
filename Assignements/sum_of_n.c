#include <stdio.h>

int main(){

	int n;
	scanf("%d",&n);//read the number from a file
	
	int total_sum=0;
	for (int i=1;i<n+1;i++)
        total_sum+=i;
	printf("total sum: %d",total_sum );
	
	return 0;
}
