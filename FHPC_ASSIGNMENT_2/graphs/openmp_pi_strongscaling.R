library(readr)
time_executions <- read_csv2("time_executions_strong.csv")
View(time_executions)

plot(time_executions$p,time_executions$time,type = "l",ylab = "Elapsed time",xlab= "N of cores",main = "Openmp_pi Strong Scaling")
serial_time=time_executions$time[1]
plot(time_executions$p,serial_time/time_executions$time,type = "l",ylab = "speedup",xlab= "N of cores",main = "Openmp_pi Speedup")
