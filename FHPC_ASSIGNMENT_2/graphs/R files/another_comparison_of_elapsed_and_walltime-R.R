library(readr)
omp_elapsed_time <- read_csv("R files/time_executions/omp_elapsed_time.csv")
omp_walltime_execution <- read_csv("R files/time_executions/omp_walltime_execution.csv")




plot(omp_elapsed_time$N,omp_elapsed_time$time,type="l",col =ylab="execution time",xlab="N")

lines(omp_walltime_execution$N,omp_walltime_execution$time,type="l")
