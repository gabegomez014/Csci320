#include <stdio.h>

__global__ void square(float * d_out, float * d_in){
    int idx = blockIdx.x *blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
	float f = d_in[idx];
    d_out[idx] = f * f;
}

int main(int argc, char ** argv) {
	
	const int ARRAY_SIZE=atoi(argv[1]);
	const int ARRAY_BYTES = ARRAY_SIZE * sizeof(float);

	// generate the input array on the host
	//float h_in[ARRAY_SIZE];
	float *h_in;
	float *h_out;
	//cudaMalloc((void**) &h_in, ARRAY_BYTES);
	//cudaMalloc((void**) &h_out, ARRAY_BYTES);
	h_in = (float *) malloc(ARRAY_BYTES);
	h_out = (float *) malloc(ARRAY_BYTES);
	for (int i = 0; i < ARRAY_SIZE; i++) {
		h_in[i] = float(i);
	}
	//float h_out[ARRAY_SIZE];

	// declare GPU memory pointers
	float * d_in;
	float * d_out;

	// allocate GPU memory
	cudaMalloc((void**) &d_in, ARRAY_BYTES);
	cudaMalloc((void**) &d_out, ARRAY_BYTES);

	// transfer the array to the GPU
	cudaMemcpy(d_in, h_in, ARRAY_BYTES, cudaMemcpyHostToDevice);

	// launch the kernel
	int blocks = 1;
	for (int k = 0; k < ARRAY_SIZE; k++) {
		if (ARRAY_SIZE / blocks <= 1024) {
			break;
		}
	
		else { blocks += 1; }
	}
	square<<<blocks,ARRAY_SIZE/blocks>>>(d_out, d_in);

	// copy back the result array to the CPU
	cudaMemcpy(h_out, d_out, ARRAY_BYTES, cudaMemcpyDeviceToHost);

	// print out the resulting array
	for (int i =0; i < ARRAY_SIZE; i++) {
		printf("%f", h_out[i]);
		printf(((i % 4) != 3) ? "\t" : "\n");
	}

	cudaError err;
	
	if (cudaSuccess != (err = cudaGetLastError()) ) {
		fprintf(stderr, "CUDA errror: %s\n", cudaGetErrorString(err));
		exit(-2);
	}

	cudaFree(d_in);
	cudaFree(d_out);

	return 0;
}
