library(readr)

times_strong_scalability = read.csv("results/time_execution_strong_mandelbrot.csv")

plot(times_strong_scalability$p,times_strong_scalability$time, type="l",xlab="number of threads",ylab="execution time", main="Strong scaling test")



times_weak_scalability = read.csv("results/time_execution_weak_mandelbrot.csv")

plot(times_weak_scalability$p,times_weak_scalability$time, type="l",xlab="number of threads",ylab="execution time", main="Weak scaling test")
