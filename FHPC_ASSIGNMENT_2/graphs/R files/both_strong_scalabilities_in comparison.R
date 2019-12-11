library(readr)
time_executions_array_sum <- read_csv2("time_executions_array_sum.csv")
time_executions_touch_by_all <- read_csv2("time_executions_touch_by_all.csv")



plot(time_executions_touch_by_all$p,time_executions_touch_by_all$time,type = "l",ylim = c(5,8),ylab = "elapsed time",xlab= "N of cores", col = "red", main = "Strong Scaling")
lines(time_executions_array_sum$p,time_executions_array_sum$time,type = "l",ylab = "elapsed time",xlab= "N of cores", col = "blue")


legend(14, 8, legend = c("touch_by_all","array_sum"), fill = c("red","blue"), col="red", bg ="white")
serial_time_touch_by_all=time_executions_touch_by_all$time[1]
serial_time_array_sum=time_executions_array_sum$time[1]
speedup_touch_by_all =serial_time_touch_by_all/time_executions_touch_by_all$time 
speedup_array_sum =serial_time_array_sum/time_executions_array_sum$time


plot(time_executions_touch_by_all$p,speedup_touch_by_all,type = "l",ylab = "elapsed time",xlab= "N of cores", col = "red", main = "Speedup")
lines(time_executions_array_sum$p,speedup_array_sum,type = "l",ylab = "elapsed time",xlab= "N of cores", col = "blue")
legend(14, 1.5, legend = c("touch_by_all","array_sum"), fill = c("red","blue"), col="red", bg ="white")


e_touch_by_all = (1/speedup_touch_by_all- 1/time_executions_touch_by_all$p)/(1-1/time_executions_touch_by_all$p) 
plot(time_executions_array_sum$p,e_touch_by_all,type = "l",ylim =c(0,1),ylab = "e(n,p)",xlab= "N of cores", col = "red", main = "Parallel Overhead Estimate")
e_array_sum = (1/speedup_array_sum- 1/time_executions_array_sum$p)/(1-1/time_executions_array_sum$p) 
lines(time_executions_array_sum$p,e_array_sum,type = "l",ylab = "overhead",xlab= "N of cores", col = "blue", main = "Parallel Overhead")
legend(14, 0.65, legend = c("touch_by_all","array_sum"), fill = c("red","blue"), col="red", bg ="white")

