library(readr)
library(dplyr)

execution_parts_omp <- read_csv2("R files/measurements/parts_results_openmp/execution_parts.csv")
execution_parts_mpi <- read_csv2("R files/measurements/parts_results_mpi/execution_parts_mpi.csv")
View(execution_parts)

test1<-filter(execution_parts_mpi,execution_parts_mpi$N=="5e+07")



test2<-filter(execution_parts_mpi,execution_parts_mpi$N=="1e+08")
test3<-filter(execution_parts_mpi,execution_parts_mpi$N=="2e+08")
test4<-filter(execution_parts_mpi,execution_parts_mpi$N=="3e+08")
test5<-filter(execution_parts_mpi,execution_parts_mpi$N=="4e+08")
test6<-filter(execution_parts_mpi,execution_parts_mpi$N=="5e+08")
test7<-filter(execution_parts_mpi,execution_parts_mpi$N=="6e+08")
test8<-filter(execution_parts_mpi,execution_parts_mpi$N=="7e+08")
test9<-filter(execution_parts_mpi,execution_parts_mpi$N=="8e+08")
test10<-filter(execution_parts_mpi,execution_parts_mpi$N=="9e+08")
test11<-filter(execution_parts_mpi,execution_parts_mpi$N=="1e+09")

mean1<-c(test1$N[1],mean(test1$time_points),mean(test1$time_sum))
mean2<-c(test2$N[1],mean(test2$time_points),mean(test2$time_sum))
mean3<-c(test3$N[1],mean(test3$time_points),mean(test3$time_sum))
mean4<-c(test4$N[1],mean(test4$time_points),mean(test4$time_sum))
mean5<-c(test5$N[1],mean(test5$time_points),mean(test5$time_sum))
mean6<-c(test6$N[1],mean(test6$time_points),mean(test6$time_sum))
mean7<-c(test7$N[1],mean(test7$time_points),mean(test7$time_sum))
mean8<-c(test8$N[1],mean(test8$time_points),mean(test8$time_sum))
mean9<-c(test9$N[1],mean(test9$time_points),mean(test9$time_sum))
mean10<-c(test10$N[1],mean(test10$time_points),mean(test10$time_sum))
mean11<-c(test11$N[1],mean(test11$time_points),mean(test11$time_sum))

N_mpi = c(mean1[1],mean2[1],mean3[1],mean4[1],mean5[1],mean6[1],mean7[1],mean8[1],mean9[1],mean10[1],mean11[1])
time_points_mpi = c(mean1[2],mean2[2],mean3[2],mean4[2],mean5[2],mean6[2],mean7[2],mean8[2],mean9[2],mean10[2],mean11[2])
time_sum_mpi = c(mean1[3],mean2[3],mean3[3],mean4[3],mean5[3],mean6[3],mean7[3],mean8[3],mean9[3],mean10[3],mean11[3])


plot(execution_parts_omp$N,execution_parts_omp$time_points,ylim=c(0,3),type="l",col="blue",ylab="execution time",xlab="N",main="Points estimation execution time")
lines(N_mpi,time_points_mpi,type ="l",col="red")

legend(0.5e+08, 3, legend = c("mpi_pi.c","openmp_pi.c"), fill = c("red","blue"), col="red", bg ="white")


plot(execution_parts_omp$N,execution_parts_omp$time_sum,ylim=c(0,0.05),type="l",col="blue",ylab="execution time",xlab="N",main="Total sum execution time")
lines(N_mpi,time_sum_mpi,type ="l",col="red")

legend( 0.5e+08,0.05, legend = c("mpi_pi.c","openmp_pi.c"), fill = c("red","blue"), col="red", bg ="white")

plot(execution_parts_omp$N,execution_parts_omp$time_sum+execution_parts_omp$time_points,type="l",col="blue",ylab="execution time",xlab="N",main="Total execution time")
lines(N_mpi,time_sum_mpi+time_points_mpi,type ="l",col="red")

legend( 0.5e+08,1.5, legend = c("mpi_pi.c","openmp_pi.c"), fill = c("red","blue"), col="red", bg ="white")


