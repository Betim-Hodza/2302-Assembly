/*
    C program to call ARMv7 assembly subroutines
    that uses structures

    output for this data

      the overall class average is 81.066673
*/

#include <stdio.h>
#include <inttypes.h>

struct scores 
{
    char name[15];
    float hwAvg;
    int exam1;
    int exam2;
    int final;
};


float calcClassAvg(struct scores [], int32_t n);
// given an array of structures and the length of the array
// returns the class average

int main(void) 
{
    struct scores cse2312[] = {{"Alex", 75.6, 80, 70, 72},      // 74.3
                               {"Bart", 81.7, 85, 69, 75},      // 77.375
                               {"Charlene", 89.5, 95, 90, 92}}; // 91.525
    float classAverage;
    int length = sizeof( cse2312 )/sizeof( struct scores );

    classAverage = calcClassAvg(cse2312, length);
    printf("the overall class average is %f\n", classAverage);
}

