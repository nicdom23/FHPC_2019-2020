library(readr)
strong_scalability_elapsed_time_openmp <- read_csv("strong_scaling_openmp/strong_scalability_elapsed_time_openmp.csv")
View(strong_scalability_elapsed_time_openmp)

strong_scalability_walltime_openmp <- read_csv("strong_scaling_openmp/strong_scalability_walltime_openmp.csv")
View(strong_scalability_walltime_openmp)

plot(strong_scalability_elapsed_time_openmp$p,strong_scalability_elapsed_time_openmp$time, type="l",main="strong scalability elapsed time openmp")


plot(strong_scalability_walltime_openmp$p,strong_scalability_walltime_openmp$time,type="l",main="strong scalability walltime openmp")

plot(strong_scalability_elapsed_time_openmp$p,strong_scalability_elapsed_time_openmp$time-strong_scalability_walltime_openmp$time, type="l",main="strong scalability overhead estimation openmp_pi")

#plots on the same box
plot(strong_scalability_elapsed_time_openmp$p,strong_scalability_elapsed_time_openmp$time, ylab="time",xlab="p",col="blue",type="l",main="strong scalability execution times openmp_pi")


lines(strong_scalability_walltime_openmp$p,strong_scalability_walltime_openmp$time,col="red",type="l",main="strong scalability walltime openmp")
legend(13, 20, legend = c("walltime","elapsed time"), fill = c("red","blue"), col="red", bg ="white")

#4 plots on the same box

plot(strong_scalability_elapsed_time_openmp$p,strong_scalability_elapsed_time_openmp$time, col="blue",type="l",main="strong scalability execution times openmp_pi")


lines(strong_scalability_walltime_openmp$p,strong_scalability_walltime_openmp$time,col="red",type="l",main="strong scalability walltime openmp")
lines(p_mpi_strongscaling,times_walltimes_mpi,type="l",col="red",main="strong scaling execution times mpi_pi")
lines(strong_scaling_elapsed_time_mpi$p,strong_scaling_elapsed_time_mpi$time,col="blue",type="l",main="strong scaling elapsed times mpi")

legend(13, 20, legend = c("walltime","elapsed time"), fill = c("red","blue"), col="red", bg ="white")


legend(13, 20, legend = c("walltime","elapsed time"), fill = c("red","blue"), col="red", bg ="white")



