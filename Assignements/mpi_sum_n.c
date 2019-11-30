#include<stdio.h>
#include<stdlib.h>
#include<mpi.h>
#define SUBPROBLEM_SIZE 5
int main(int argc,char**argv){

int size,rank;
MPI_Init(&argc,&argv);
MPI_Comm_size(MPI_COMM_WORLD,&size);
MPI_Comm_rank(MPI_COMM_WORLD,&rank);

double init_time, end_time;
init_time = MPI_Wtime();
int sum =0;
MPI_Status status;
if (size<3){
printf("required more processes\n");
MPI_Finalize();
exit(0);
}

int message;
if (rank == 0){

       scanf("%d",&message);
			
int array_size = (message-message%(size-1))/(size-1);
            
               for( int i = 0 ;i<message%(size-1);++i){

                        sum += (size-1)*(array_size)+i+1;
}
int other_node;
int tot_sum=0;
tot_sum += sum;
        for (other_node=1;other_node<size;other_node++){
                MPI_Send(&message,1,MPI_INT,other_node,125,MPI_COMM_WORLD);   
                MPI_Recv(&sum,1,MPI_INT,other_node,0,MPI_COMM_WORLD,&status);
                tot_sum += sum;
                }
printf("total sum: %d \n",tot_sum);

        

}else if(rank>0){

     MPI_Recv(&message,1,MPI_INT,0,125,MPI_COMM_WORLD,&status);
     int array_size = (message-message%(size-1))/(size-1);
              
     for( int i = 0 ; i<array_size;++i){

          sum += (rank-1)*(array_size)+i+1;
        }
                MPI_Send(&sum,1,MPI_INT,0,0,MPI_COMM_WORLD);
        }

end_time = MPI_Wtime();
printf("time spent on process %d is %f seconds\n",rank,end_time-init_time);

MPI_Finalize();

return 0;
}
