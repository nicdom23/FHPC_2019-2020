
#include<iostream>
#include"mpi.h"

int main(int argc,char**argv){

        int size,rank;

        MPI_Init(&argc,&argv);
        MPI_Comm_size(MPI_COMM_WORLD,&size);
        MPI_Comm_rank(MPI_COMM_WORLD,&rank);

        double init_time, end_time;
		double init_read_time, end_read_time;
		double init_comm_time, end_comm_time;
		double init_comp_time, end_comp_time;
        init_time = MPI_Wtime();
        MPI_Status status;

        int problem_size;
		unsigned long long int sum =0;
        if (rank == 0){
				init_read_time = MPI_Wtime();
                std::cin >>problem_size;//read a number from file
                 end_read_time = MPI_Wtime();
				 std::cout<<"reading time spent on process "<<rank<< " is "<<end_read_time-init_read_time<< " seconds"<<std::endl<<std::endl;

				int array_size = (problem_size-problem_size%(size-1))/(size-1);//calculating subproblem size
                for( int i = 0 ;i<problem_size%(size-1);++i)
                        sum += (size-1)*(array_size)+i+1;//sum of the numbers that remain outsite the subproblems
				unsigned long long int tot_sum=0;
                tot_sum += sum;
				
				//communication start
                int other_node;
                 for (other_node=1;other_node<size;other_node++){
					 init_comm_time = MPI_Wtime();
                     MPI_Send(&problem_size,1,MPI_INT,other_node,125,MPI_COMM_WORLD);
                     MPI_Recv(&sum,1,MPI_UNSIGNED_LONG_LONG,other_node,0,MPI_COMM_WORLD,&status);
                   end_comm_time = MPI_Wtime();
				   std::cout<<"communication time spent with process "<<other_node<< " is "<<end_comm_time-init_comm_time<< "seconds"<<std::endl;

				   tot_sum += sum;//sum of partial sums
                      }
			     //communication end
                std::cout<<"TOTAL SUM:"<<tot_sum<<std::endl;

        }else if(rank>0){

            MPI_Recv(&problem_size,1,MPI_INT,0,125,MPI_COMM_WORLD,&status); //receiving problem size
            int array_size = (problem_size-problem_size%(size-1))/(size-1);//calculating subproblem size
					init_comp_time = MPI_Wtime();
                 for( int i = 0 ; i<array_size;++i)
                 	sum += (rank-1)*(array_size)+i+1; //partial sum calculation
                    end_comp_time = MPI_Wtime();
					std::cout<<"computation time spent on processor "<<rank<< " is "<<end_comp_time-init_comp_time<< " seconds"<<std::endl;

            MPI_Send(&sum,1,MPI_UNSIGNED_LONG_LONG,0,0,MPI_COMM_WORLD);//sending back the result
        }

        end_time = MPI_Wtime();
        	std::cout<<"time spent on process "<<rank<< " is "<<end_time-init_time<< " seconds"<<std::endl<<std::endl;

        MPI_Finalize();

        return 0;
}


