library(readr)
time_executions <- read_csv2("time_executions_strong.csv")
View(time_executions)

plot(time_executions$p,time_executions$time,type = "l",ylab = "Elapsed time",xlab= "N of cores",main = "Openmp_pi Strong Scaling")
serial_time=time_executions$time[1]
speedup = serial_time/time_executions$time
plot(time_executions$p,speedup,type = "l",ylim = c(0,20),ylab = "speedup",xlab= "N of cores",main = "Openmp_pi Strong Scaling Speedup")

e = (1/speedup- 1/time_executions$p)/(1-1/time_executions$p)
plot(time_executions$p[2:11],e[2:11],type = "l",ylim =c(0,1),ylab = "e(n,p)",xlab= "N of cores", col = "black", main = "Openmp_pi Parallel Overhead Estimation")
x = c(1,2,3)
x
x[1:1]
time_executions$p[2:11]
