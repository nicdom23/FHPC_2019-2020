library(readr)
time_executions <- read_csv("time_execution_for_weak_scalablity.csv")
View(time_executions)


library(readr)
time_executions <- read_csv2("time_execution_for_weak_scalability.csv")


plot(time_executions$p,time_executions$time,type = "l",ylab = "Elapsed time",xlab= "N of cores",main = "Openmp_pi Weak Scaling")
serial_time=time_executions$time[1]
serial_time
plot(time_executions$p,serial_time/time_executions$time,type = "l",ylim =c(0,20),ylab = "speedup",xlab= "N of cores",main = "Openmp_pi Weak Scaling Speedup")



