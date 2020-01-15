library(readr)
time_execution_of_code_openmp <- read_csv2("parts_results_openmp/time_execution_of_code_openmp.csv")
View(time_execution_of_code_openmp)

plot(time_execution_of_code_openmp$N,time_execution_of_code_openmp$time,type="l",ylab="time",xlab="N")

plot(execution_parts$N,execution_parts$time_sum+execution_parts$time_points,type="l",col="blue",ylab="execution time",xlab="N",main="Total execution time")
lines(N,time_sum+time_points,type ="l",col="red")
