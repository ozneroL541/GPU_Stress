#ifndef _PERFECT_NUMBER_H_
#define _PERFECT_NUMBER_H_
/**
 * Calculates the integer square root of a number.
 * @param n The number to calculate the square root of.
 * @return The integer square root of n.
 */
unsigned long long square_root(const unsigned long long n);
/**
 * Checks if a number is a perfect number.
 * A perfect number is a positive integer that is equal to the sum of its proper divisors.
 * @param n The number to check.
 * @return 1 if n is a perfect number, 0 otherwise.
 */
char is_perfect_number(const unsigned long long n);
#endif
