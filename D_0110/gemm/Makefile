<<<<<<< HEAD
### MKL libraries
###
=======
>>>>>>> 0448face249e52a4fd7755555907e16e0db85c92
###
MKL= -L${MKLROOT}/lib/intel64  -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -lm -ldl

all: gemm.x gemm_gpu.x

cpu: gemm.x

gpu: gemm_gpu.x


gemm.x: gemm.c
	gcc -DUSE_FLOAT $^ -m64 -I${MKLROOT}/include $(MKL)  -o $@

gemm_gpu.x: gemm_gpu.c
<<<<<<< HEAD
	nvcc -DUSE_FLOAT $^ -m64 -I${MKLROOT}/include $(MKL) -lcublas  -o $@
=======
	nvcc -DUSE_FLOAT $^ -m64 -I${MKLROOT}/include $(MKL)  -lcublas  -o $@
>>>>>>> 0448face249e52a4fd7755555907e16e0db85c92

clean:
	rm -rf *.x
