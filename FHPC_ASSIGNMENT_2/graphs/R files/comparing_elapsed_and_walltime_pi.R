library(readr)
mpi_elapsed_time <- read_csv("mpi_time_executions/mpi_elapsed_time.csv")

mpi_walltimes <- read_csv("mpi_time_executions/mpi_walltimes.csv")

omp_elapsed_time <- read_csv("omp_time_executions/omp_elapsed_time.csv")

omp_walltime_execution <- read_csv("omp_time_executions/omp_walltime_execution.csv")


test1<-filter(mpi_walltimes,mpi_walltimes$N=="5e+07")



test2<-filter(mpi_walltimes,mpi_walltimes$N=="1e+08")
test3<-filter(mpi_walltimes,mpi_walltimes$N=="2e+08")
test4<-filter(mpi_walltimes,mpi_walltimes$N=="3e+08")
test5<-filter(mpi_walltimes,mpi_walltimes$N=="4e+08")
test6<-filter(mpi_walltimes,mpi_walltimes$N=="5e+08")
test7<-filter(mpi_walltimes,mpi_walltimes$N=="6e+08")
test8<-filter(mpi_walltimes,mpi_walltimes$N=="7e+08")
test9<-filter(mpi_walltimes,mpi_walltimes$N=="8e+08")
test10<-filter(mpi_walltimes,mpi_walltimes$N=="9e+08")
test11<-filter(mpi_walltimes,mpi_walltimes$N=="1e+09")

mean1<-c(test1$N[1],mean(test1$times))
mean2<-c(test2$N[1],mean(test2$times))
mean3<-c(test3$N[1],mean(test3$times))
mean4<-c(test4$N[1],mean(test4$times))
mean5<-c(test5$N[1],mean(test5$times))
mean6<-c(test6$N[1],mean(test6$times))
mean7<-c(test7$N[1],mean(test7$times))
mean8<-c(test8$N[1],mean(test8$times))
mean9<-c(test9$N[1],mean(test9$times))
mean10<-c(test10$N[1],mean(test10$times))
mean11<-c(test11$N[1],mean(test11$times))

N_mpi = c(mean1[1],mean2[1],mean3[1],mean4[1],mean5[1],mean6[1],mean7[1],mean8[1],mean9[1],mean10[1],mean11[1])
times_walltimes_mpi = c(mean1[2],mean2[2],mean3[2],mean4[2],mean5[2],mean6[2],mean7[2],mean8[2],mean9[2],mean10[2],mean11[2])


plot(mpi_elapsed_time$N,mpi_elapsed_time$time-times_walltimes_mpi,ylim =c(-1,4),type="l",col="red",ylab="execution time",xlab="N",main="Overhead time estimation")
lines(omp_elapsed_time$N,omp_elapsed_time$time-omp_walltime_execution$time,type ="l",col="blue")
    
legend(0.5e+08, 4, legend = c("mpi_pi.c","openmp_pi.c"), fill = c("red","blue"), col="red", bg ="white")

#plot of elapsedtime and walltime of openmp_pi
plot(omp_elapsed_time$N,omp_elapsed_time$time,type ="l",col="red",main="Times at comparison")
lines(omp_elapsed_time$N,omp_walltime_execution$time,type ="l",col="green")
legend( 0.5e+08,1.5, legend = c("elapsed time","walltime"), fill = c("red","green"), col="red", bg ="white")






plot(execution_parts_omp$N,execution_parts_omp$time_sum,ylim=c(0,0.05),type="l",col="blue",ylab="execution time",xlab="N",main="Total sum execution time")
lines(N_mpi,time_sum_mpi,type ="l",col="red")

legend( 0.5e+08,3, legend = c("mpi_pi.c","openmp_pi.c"), fill = c("red","blue"), col="red", bg ="white")

plot(execution_parts_omp$N,execution_parts_omp$time_sum+execution_parts_omp$time_points,type="l",col="blue",ylab="execution time",xlab="N",main="Total execution time")
lines(N_mpi,time_sum_mpi+time_points_mpi,type ="l",col="red")

legend( 0.5e+08,1.5, legend = c("mpi_pi.c","openmp_pi.c"), fill = c("red","blue"), col="red", bg ="white")

