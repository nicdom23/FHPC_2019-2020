nodes = c(1,2,4,5,10)
time=c(2.9363,4.0390,4.0300,4.0400,4.0600)

plot(nodes,time,type = "l", ylim=c(2,5),ylab ="elapsed time",xlab="N of nodes",main="Elapsed time of mpi_pi on 20 processors")


time_executions <- read_csv2("time_executions_strong.csv")
plot(1,1)
serial_time= 1.56
abline(serial_time,0)
serial_time
