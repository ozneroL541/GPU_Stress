#ifndef _CPU_PERFECT_H_
#define _CPU_PERFECT_H_

#ifndef _PERFECT_NUMBER_H_
    #include "perfect_number.h"
#endif

#include <unistd.h>
#include <pthread.h>
#include <stdlib.h>

/**
 * Returns the maximum number of concurrent threads supported by the system.
 * @return The maximum number of concurrent threads.
 */
unsigned short max_threads(void);
/**
 * Thread function to check if a number is perfect.
 * @param arg The number to check.
 * @return the arg if the number is perfect, 0 otherwise.
 */
void *is_perfect_t(void *arg);
/**
 * Initializes threads to check for perfect numbers in parallel.
 * @param threads Pointer to the array of pthread_t.
 * @param thread_count Number of threads to create.
 * @param numbers Array of numbers to check.
 * @return number of failed thread creations, 0 on success.
 */
char init_perfect_threads(pthread_t* threads, const unsigned short thread_count, unsigned long long * numbers);
/**
 * Destroys the threads created for checking perfect numbers.
 * @param threads Pointer to the array of pthread_t.
 * @param thread_count Number of threads that were created.
 * @return number of failed thread joins, 0 on success.
 */
char join_perfect_threads(pthread_t* threads, const unsigned short thread_count);
/**
 * Manages the creation, execution, and destruction of threads for checking perfect numbers.
 * @param first_number First number to be checked.
 * @param thread_count Number of threads to create.
 * @return 0 on success, 1 on failure.
 */
char manage_perfect_threads(const unsigned long long first_number, const unsigned short thread_count);
/**
 * Searches for perfect numbers.
 */
void search_perfect_numbers(void);
#endif
