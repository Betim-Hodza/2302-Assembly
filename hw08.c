/*
write assembly function to count last streak of
of the given character
*/
#include <stdio.h>
#include <inttypes.h>
void shiftLeftBy2(int32_t d[], uint32_t len, int32_t extra1, int32_t extra2);
// given an array of integers and the length of the array,
// shifts the array values to the left by two and then
// adds the values extra1 and extra2 to the right end, with
// extra2 as the new last array element
// assume that the input array will always have at least 2 values
int32_t countMatch(char left[], char right[]);
// given two null-terminated strings of equal length
// returns the count of how many consecutive characters (starting
// from the left) are the same
// assume the count will fit into a 32-bit signed integer

void printArray(int32_t d[], uint32_t len);
void processIntArray(int32_t d[], uint32_t len);

int main(void) 
{
	int32_t a[] = {100, 200};
	int32_t b[] = {1, 2, 3, 4};
	int32_t c[] = {5, 6, 7, 8, 9};
	uint32_t len;
	char s1[] = "abcdefg";
	char s2[] = "abcdefG";
	char s3[] = "abcXefg";
	char s4[] = "xyzxyzx";
	len = sizeof(a)/sizeof(a[0]);
	processIntArray(a, len);
	len = sizeof(b)/sizeof(b[0]);
	processIntArray(b, len);
	len = sizeof(c)/sizeof(c[0]);
	processIntArray(c, len);
	printf("matches = %"PRId32"\n", countMatch(s1, s1) );
	printf("matches = %"PRId32"\n", countMatch(s1, s2) );
	printf("matches = %"PRId32"\n", countMatch(s1, s3) );
	printf("matches = %"PRId32"\n", countMatch(s1, s4) );
}
void processIntArray(int32_t d[], uint32_t len) 
{
	printf("before: ");
	printArray(d, len);
	shiftLeftBy2(d, len, 300, 400);
	printf(" after: ");
	printArray(d, len);
	printf("\n");
}
void printArray(int32_t d[], uint32_t len) 
{
	uint32_t i;
	for(i = 0; i < len; i++)
	{
		printf("%4"PRId32"", d[i]);
		printf("\n");
	}
}
