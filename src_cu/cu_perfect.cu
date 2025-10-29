#include "cu_perfect.h"
#include "perfect_number.h"

__device__
unsigned long long square_root(const unsigned long long n) {
    return (unsigned long long)__double2ull_rz(__dsqrt_rn((double)n));
}
__device__
char is_perfect_number(const unsigned long long n) {
    unsigned long long
        /** Sum of divisors */
        sum = 1, 
        /** Index */
        i, 
        /** Square root of n */
        sqrt_n,
        /** The complementary divisor */
        other;

    sqrt_n = square_root(n);
    for (i = 2; i <= sqrt_n; i++) {
        if (n % i == 0) {
            sum += i;
            other = n / i;
            if (other != i) sum += other;
        }
    }
    return sum == n && n != 1;
}

__global__
void is_perfect(const unsigned long long number, unsigned long long *results, int *count) {
    unsigned long long idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned long long n = number + idx * 2;
    if (is_perfect_number(n)) {
        int pos = atomicAdd(count, 1);
        results[pos] = n;
    }
}
unsigned short get_cuda_threads(void) {
    /** Returns the maximum number of threads per block. */
    int device;
    cudaDeviceProp prop;

    cudaGetDevice(&device);
    cudaGetDeviceProperties(&prop, device);

    return prop.maxThreadsPerBlock;
}
unsigned short get_cuda_blocks(void) {
    /** Returns the number of CUDA blocks. */
    int device;
    cudaDeviceProp prop;

    cudaGetDevice(&device);
    cudaGetDeviceProperties(&prop, device);

    return prop.maxGridSize[0];
}

char manage_perfect_cuda(unsigned long long first_number, const unsigned short thread_count, const unsigned short block_count) {
    /** Device variables */
    unsigned long long  *d_results,
                        /** Array of numbers to concurrently check */
                        *h_results;
    /** Host variable to store the count of perfect numbers found */
    const size_t max_results = thread_count * block_count;
    /** Counter for perfect numbers found */
    int     *d_count,
            /** Device counter */
            h_count = 0;
    #ifdef _STDIO_H
    /** Counter for perfect numbers found */
    unsigned long long c = 0;
    #endif

    h_results = (unsigned long long*)malloc(max_results * sizeof(unsigned long long));
    cudaMalloc(&d_results, max_results * sizeof(unsigned long long));
    cudaMalloc(&d_count, sizeof(int));

    while (1) {
        cudaMemset(d_count, 0, sizeof(int));
        is_perfect<<<block_count, thread_count>>>(first_number, d_results, d_count);
        cudaMemcpy(&h_count, d_count, sizeof(int), cudaMemcpyDeviceToHost);
        if (h_count > 0) {
            cudaMemcpy(h_results, d_results, h_count * sizeof(unsigned long), cudaMemcpyDeviceToHost);
            for (int i = 0; i < h_count; i++) {
                #ifdef _STDIO_H
                printf("%2lu\t%10lu\n", ++c, h_results[i]);
                #endif
            }
        }
        first_number += max_results * 2;
    }

    cudaFree(d_results);
    cudaFree(d_count);
    free(h_results);

    return 0;
}
void search_perfect_numbers(void) {
    /** First number to check */
    const unsigned long long first_number = 2;
    /** Number of threads */
    const unsigned short thread_count = get_cuda_threads();
    /** Number of blocks */
    const unsigned short block_count = get_cuda_blocks();

    manage_perfect_cuda(first_number, thread_count, block_count);
}
