#bash command to test the execution of array_sum

for  i in 10 100 1000
do
export OMP_NUM_THREADS=${i}
/usr/bin/time ./array_sum -> results/array_sum_${i}.txt
done
