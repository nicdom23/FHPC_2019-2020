
library(readr)
time_executions <- read_csv2("time_executions_array_sum.csv")
View(time_executions)

plot(time_executions$p,time_executions$time,type = "l",ylab = "elapsed time",xlab= "N of cores")
serial_time=time_executions$time[1]
plot(time_executions$p,serial_time/time_executions$time,type = "l",ylab = "speedup",xlab= "N of cores")
