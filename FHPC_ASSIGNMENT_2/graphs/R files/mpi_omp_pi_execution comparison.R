library(readr)
mpi_pi_execution_comparison <- read_csv2("R files/measurements/mpi_pi_execution_comparison.csv")

time_execution_for_comparison_omp <- read_csv2("R files/measurements/time_execution_for_comparison_omp.csv")

View(mpi_pi_execution_comparison)

plot(mpi_pi_execution_comparison$N,mpi_pi_execution_comparison$time,type="l",col="red",ylim=c(0,10),ylab="elapsed time",xlab="N",main="Time-to-solution")
lines(time_execution_for_comparison_omp$N,time_execution_for_comparison_omp$time,type="l",col="blue")
legend(1.0e+09, 10, legend = c("mpi_pi","omp_pi"), fill = c("red","blue"), col="red", bg ="white")

#plot to compare the differences between elapsed_time and walltime: execute first comparing_parts_of_two_codes
plot(execution_parts_omp$N,time_execution_for_comparison_omp$time-execution_parts_omp$time_sum-execution_parts_omp$time_points,ylim=c(-1,5),type="l",col="blue",ylab="execution time",xlab="N",main="Overhead estimation")
lines(N_mpi,mpi_pi_execution_comparison$time - time_sum_mpi-time_points_mpi,type ="l",col="red")
legend(1.0e+08, 5, legend = c("mpi_pi","omp_pi"), fill = c("red","blue"), col="red", bg ="white")

