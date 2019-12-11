library(readr)
#plotting strong scaling walltime and elapsed time
strong_scaling_elapsed_time_mpi <- read_csv("strong_scaling_mpi/strong_scaling_elapsed_time_mpi.csv")
plot(strong_scaling_elapsed_time_mpi$p,strong_scaling_elapsed_time_mpi$time,type="l",main="strong scaling elapsed times mpi")

View(strong_scaling_elapsed_time_mpi)

strong_scaling_walltime_mpi <- read_csv("strong_scaling_mpi/strong_scaling_walltime.csv")
View(strong_scaling_walltime_mpi)

test1<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="1")

test2<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="1")
test3<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="2")
test4<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="4")
test5<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="6")
test6<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="8")
test7<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="10")
test8<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="12")
test9<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="14")
test10<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="16")
test11<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="18")
test12<-filter(strong_scaling_walltime_mpi,strong_scaling_walltime_mpi$p=="20")


mean1<-c(test1$p[1],mean(test1$time))
mean2<-c(test2$p[1],mean(test2$time))
mean3<-c(test3$p[1],mean(test3$time))
mean4<-c(test4$p[1],mean(test4$time))
mean5<-c(test5$p[1],mean(test5$time))
mean6<-c(test6$p[1],mean(test6$time))
mean7<-c(test7$p[1],mean(test7$time))
mean8<-c(test8$p[1],mean(test8$time))
mean9<-c(test9$p[1],mean(test9$time))
mean10<-c(test10$p[1],mean(test10$time))
mean11<-c(test11$p[1],mean(test11$time))
mean12<-c(test12$p[1],mean(test12$time))

p_mpi_strongscaling = c(mean1[1],mean2[1],mean3[1],mean4[1],mean5[1],mean6[1],mean7[1],mean8[1],mean9[1],mean10[1],mean11[1],mean12[1])
times_walltimes_mpi = c(mean1[2],mean2[2],mean3[2],mean4[2],mean5[2],mean6[2],mean7[2],mean8[2],mean9[2],mean10[2],mean11[2],mean12[2])

plot(p_mpi_strongscaling,times_walltimes_mpi,type="l",main="strong scaling walltimes mpi")

#strong scaling difference
plot(p_mpi_strongscaling,strong_scaling_elapsed_time_mpi$time-times_walltimes_mpi,type="l",main="strong scaling overhead estimation mpi")

#both plots on the same box

plot(p_mpi_strongscaling,times_walltimes_mpi,type="l",col="red",ylab="time",xlab="p",main="strong scaling execution times mpi_pi")
lines(strong_scaling_elapsed_time_mpi$p,strong_scaling_elapsed_time_mpi$time,col="blue",type="l",main="strong scaling elapsed times mpi")

legend(13, 20, legend = c("walltime","elapsed time"), fill = c("red","blue"), col="red", bg ="white")


