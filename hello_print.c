#include<stdio.h>
#include<stdlib.h>
#include<mpi.h>
#include<string.h>

int main(int argc,char**argv){

int rank,size;
MPI_Init(&argc,&argv);
MPI_Comm_rank(MPI_COMM_WORLD,&rank);
MPI_Comm_size(MPI_COMM_WORLD,&size);

int message[2] //buffer for sending and recieving messages
int dest, src; //destinatnion and source process variaables
int tag = 0;
MPI_Status status;

if(size==1){
	printf("more than one process needed")
	MPI_Finalize();
	exit(0);
	}
if(rank!=0){//lets send a mesage to rank 0
	message[0]=rank;
	message[1]=size;
	dest = 0; //destinatary is rank 0
	MPI_Send(message,2,MPI_INT,dest,tag,MPI_COMM_WORLD);
	}else{
	//if rank = 0 recieve a message from everybody else
	for(src=1;src<size;src++){
		MPI_Recv(message,2,MPI_INT,src,tag,MPI_COMM_WORLD);
		//prints the message just received,prints are in rank order
		printf("hello from process %d of %d \n",message[0],message[1]);	
		}
	}
MPI_Finalize();
return 0;
}

