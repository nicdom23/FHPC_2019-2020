library(readr)
time_execution_of_code_openmp <- read_csv2("time_exec_results_omp/time_execution_of_code_openmp.csv")
View(time_execution_of_code_openmp)


walltime_execution_of_code_openmp <- read_csv("time_exec_results_omp/walltime_execution_of_code_openmp.csv")
View(walltime_execution_of_code_openmp)

overhead=

plot(time_execution_of_code_openmp$N,time_execution_of_code_openmp$time-walltime_execution_of_code_openmp$time,type="l")


library(readr)
list_of_elapsed_times_for_omp_pi <- read_csv("times_results_openmppi/list_of_elapsed_times_for_omp_pi.csv")
View(list_of_elapsed_times_for_omp_pi)

library(readr)
list_of_walltime_execution_of_code_openmp <- read_csv("times_results_openmppi/list_of_walltime_execution_of_code_openmp.csv")
View(list_of_walltime_execution_of_code_openmp)
