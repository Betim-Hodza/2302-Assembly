/*
    write assembly function to count last streak of
      of the given character
*/

#include <stdio.h>
#include <inttypes.h>

int32_t countLastStreak(char* s);
// counts the number of 'X' characters in the last streak
//   assume that the string will always end in one or
//   more 'X' characters
// returns a 32-bit signed integer representing the count

void shiftRightBy5(char* input, char* output);
// copies the string in input to output, but with
//   5 spaces at the beginning.
//   the output string should add a terminating null
//   after copying the characters
// assume enough space in the output string for this


int main(void) {
    char a[] = "aXXaaaaXaaXXXXxXXaaXxxxXXXXXX";
    char b[] = "aXXaaaaXaaXXXxXX";
    char c[] = "12345678";
    char d[] = "who shifted me?";
    char out[100];

    int32_t result;

    result = countLastStreak(a);
    printf("streak count = %"PRId32"\n", result); /* streak count = 3 */

    result = countLastStreak(b);
    printf("streak count = %"PRId32"\n", result); /* streak count = 5 */

    shiftRightBy5(c, out);
    printf("|%s|\n", c);    /* |12345678| */
    printf("=%s=\n", out);  /* =     12345678= */

    shiftRightBy5(d, out);
    printf("|%s|\n", d);    /* |who shifted me?| */
    printf("=%s=\n", out);  /* =     who shifted me?= */
}


