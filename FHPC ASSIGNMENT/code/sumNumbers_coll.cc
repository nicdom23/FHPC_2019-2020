##################
#NICOLA DOMENIS### DSSC COURSE 2019/2020
##################
#include<iostream>
#include<cstdlib>

#include"mpi.h"

int main(int argc,char**argv){

        int size,rank;

        MPI_Init(&argc,&argv);
        MPI_Comm_size(MPI_COMM_WORLD,&size);
        MPI_Comm_rank(MPI_COMM_WORLD,&rank);

		//defining some execution times
        double init_time, end_time;
        double init_read_time, end_read_time;
        double init_broad_time, end_broad_time;
        double init_comp_time, end_comp_time;
        double init_redu_time, end_redu_time;

			init_time = MPI_Wtime();
        MPI_Status status;
if (size<2){
std::cout<<"required more processes"<<std::endl;
MPI_Finalize();
exit(0);
}
       int problem_size;
       unsigned long long int sum,tot_sum =0;
       if (rank == 0){
        init_read_time = MPI_Wtime();
                    std::cin >>problem_size;
		end_read_time = MPI_Wtime();

 std::cout<<"reading time spent on process "<<rank<< " is "<<end_read_time-init_read_time<< " seconds"<<std::endl<<std::endl;

	int array_size = (problem_size-problem_size%(size-1))/(size-1);
	sum = 0;
			for( int i = 0 ;i<problem_size%(size-1);++i)  //master node sums the integers that do not fit into a processor
						sum += (size-1)*(array_size)+i+1;
}
					//broadcasting the problem size to all the slave nodes
        init_broad_time = MPI_Wtime();
				MPI_Bcast(&problem_size,1,MPI_INT,0,MPI_COMM_WORLD);
        end_broad_time = MPI_Wtime();
               std::cout<<"execution time spent on broadcast by processor"<<rank<<" is "<<end_broad_time-init_broad_time<< " seconds"<<std::endl;

 if(rank>0){
		int array_size = (problem_size-problem_size%(size-1))/(size-1);
       
		sum=0;
		init_comp_time = MPI_Wtime();

			for( int i = 0 ; i<array_size;++i)
					sum += (rank-1)*(array_size)+i+1; //calculating partial sum
		end_comp_time = MPI_Wtime();
                        std::cout<<"computation time spent on processor "<<rank<< " is "<<end_comp_time-init_comp_time<< " seconds"<<std::endl;

        }
							//we use reduce to collect and sum all the partial sums from the processors
        init_redu_time = MPI_Wtime();
                MPI_Reduce(&sum,&tot_sum,1,MPI_UNSIGNED_LONG_LONG,MPI_SUM,0,MPI_COMM_WORLD);
        end_redu_time = MPI_Wtime();
         std::cout<<"execution time spent on reduce for"<<rank<< " is "<<end_redu_time-init_redu_time<< " seconds"<<std::endl<<std::endl;

if (rank==0)
                std::cout<<"TOTAL SUM:"<<tot_sum<<std::endl; //print the solution


        MPI_Finalize();

        return 0;
}





