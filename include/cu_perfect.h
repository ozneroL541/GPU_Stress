#ifndef _CU_PERFECT_H_
#define _CU_PERFECT_H_

#ifndef _PERFECT_NUMBER_H_
    #include "perfect_number.h"
#endif

#include <cuda_runtime.h>
#include <curand_kernel.h>

/**
 * Returns the maximum number of concurrent threads supported by the system.
 * @return The maximum number of concurrent threads.
 */
unsigned short get_cuda_threads(void);
/**
 * Returns the number of CUDA blocks available.
 * @return The number of CUDA blocks.
 */
unsigned short get_cuda_blocks(void);
/**
 * Manages the creation, execution, and destruction of CUDA threads for checking perfect numbers.
 * @param first_number First number to be checked.
 * @param thread_count Number of CUDA threads to create.
 * @param block_count Number of CUDA blocks to create.
 * @return 0 on success, 1 on failure.
 */
char manage_perfect_cuda(unsigned long long first_number, const unsigned short thread_count, const unsigned short block_count);
/**
 * Searches for perfect numbers.
 */
void search_perfect_numbers(void);
#endif
