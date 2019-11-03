
T_comp<-2*10^-9
T_read<-1*10^-4
T_comm <-1*10^-6 

p<-1:1000
N<-10^6


T_s = N*T_comp

T_p = T_read+(p-1+N/p)*T_comp+2*T_comm*(p-1)

speedup = T_s/T_p


plot(p,speedup,type = "l")

library(dplyr)
x<-data.frame(p,speedup)
max<- filter(x,x$speedup==max(x$speedup))


p = c(1,2,4,5,8,10,16,20,32);
time = c(0.19828200,
         0.10205293,
         0.05147886, 
         0.04226208,
         0.02889167,
         0.0227909 ,
         0.01546288, 
         0.01202011  ,
         0.00758505);

plot(p,time,type = "l")
lines(p,t)
t = c(0.190000,0.190000,0.190000,0.190000,0.190000,0.190000,0.190000,0.190000,0.190000)
t_serial = 0.190000
speedup= t_serial/time;
plot(p,speedup,type = "l")


p = c(1 ,
      2 ,  
      
      3 , 
      
      4 ,
      
      5,  
      
      6,
      
      
      7 ,
      8,
      9,
      
      10 ,
      
      15, 
      
      20 ,
      25,
      
      
      30 ,
      
      35,
      
      
      40 ,
      45,
      
      50,
      55,
      
      65,
      
      70 ,
      85,
      
      
      90 ,
      
      100 ,
      110,
      
      120 ,
      130,
      
      140,
      
      150 ,
      160,
      170,
      
      180,
      190
);
time = c(0.19834018 , 
          0.10237694,
         
          0.06810403,
         
        0.05112910,
         
         0.04208803,
         
         0.03521991,
         
         
         0.03114295,
          0.02774906,
         0.02494812,
         
         0.022473105,
         
         0.01611710,
         
          0.01290107,
         0.04538202,
         
         
         0.04738688,
         0.04664588,
         
         
         0.00709820,
         0.03946805,
         
        0.04218102 ,
        0.03909183,
         
         0.04053712,
         
        0.04279184,
         0.04293084,
         
         
         0.04550791,
         
         0.04573107 ,
          0.04612899,
         
          0.04723096,
         0.08044481,
         
         0.04769993,
         
         0.04286814,
          0.08405995,
          0.12087607,
         
         0.12373304,
         0.12087607
);

plot(p,time,type = "l")
lines(p,t)
t_serial = 0.260000
speedup= t_serial/time;
plot(p,speedup,type = "l")
lines(p,p,type ='r')

p_billion = c(
  1,
  # wallti
  5,
  # walltime on master processor : 4.20706916
  10,
  # walltime on master processor : 2.23497915
  15,
  # walltime on master processor : 1.54891181
  20,
  # walltime on master processor : 1.44179392
  25,
  # walltime on master processor : 0.96517396
  50,
  # walltime on master processor : 0.61355782
  75,
  # w,alltime on master processor : 0.35910296
  90,
  # walltime on master processor : 0.30017495
  100,
  # walltime on master processor : 0.27414989
  110,
  # walltime on master processor : 0.31551290
  
  120,
  # walltime on master processor : 0.25058603
  130,
  # walltime on master processor : 0.26568794
  140,
  # walltime on master processor : 0.25276184
  150
  # walltime on master processor : 0.23546004
    
);
time_billion = c(
   19.79908109,
   4.20706916,
 2.23497915,
  1.54891181,
   1.44179392,
   0.96517396,
  0.61355782,
 0.35910296,
   0.30017495,
  0.27414989,
   0.31551290,
 0.25058603,
0.26568794,
 0.25276184,
   0.23546004
);

plot(p_billion,time_billion,type = "l")
lines(p,p)
t_serial = 26.76
speedup= t_serial/time_billion;
plot(p_billion,speedup,type = "l")

p_100million = c(
  1,
  # walltime on master processor : 1.97930312
  5,
  # walltime on master processor : 0.42994881
  10,
  # walltime on master processor : 0.22460914
  15,
  # walltime on master processor : 0.19165015
  20,
  # walltime on master processor : 0.11935997
  25,
  # walltime on master processor : 0.09289098
  50,
  # walltime on master processor : 0.08066607
  75,
  # walltime on master processor : 0.07152891
    90,
  # walltime on master processor : 0.06218886
    100,
  # walltime on master processor : 0.06592202

    110,
  # walltime on master processor : 0.06510186
  120,
  # walltime on master processor : 0.07200909
  130,
  # walltime on master processor : 0.06397820
  140,
  # walltime on master processor : 0.06224704
  
  150,
  # walltime on master processor : 0.03052187
  
    160,
  # walltime on master processor : 0.09982419
  170,
  # walltime on master processor : 0.13634300
  190,
  # walltime on master processor : 0.09572482
  200
  # walltime on master processor : 0.06143498
);
time_100million = c(
  1.97930312,
  0.42994881,
  0.22460914,
  0.19165015,
  0.11935997,
 0.09289098,
  0.08066607,
  0.07152891,
 0.06218886,
  0.06592202,
  
  0.06510186,
   0.07200909,
  0.06397820,
  
   0.06224704,
 0.03052187,
  0.09982419,
   0.13634300,
   0.09572482,
  0.06143498
  
);

plot(p_100million,time_100million,type = "l")
lines(p,t)
t_serial = 2.51
speedup= t_serial/time_100million;
plot(p_100million,speedup,type = "l")

