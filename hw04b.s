/*
    Betim Hodza 1001928702

    what the program does:
    * program needs to move through the string grabbing each character
    * if that character is even then add 5 to the char and replace it in the original string
    * if its odd then subtract by 5
    * Dont create a second array 
    * The string should be printed to stdout
    * we need to keep count of how many characters there are so we can print out the replaced string
    * after printing the string, print the newline


    c-code
    string[] = {"string"}
    int i = 0; 
    int j = 0;

    while (i != '\0')
    {
        if ((string[i] % 2) == 0)
        {
            string[i] += 5;
        }
        if ((string[i] % 2) != 0)
        {
            string[i] -= 5;
        }
        j++
    }
    printf("%s", string);
    printf("\n"); 

    //abt the same logic

    program hw04b
*/

    .global _start

_start:
    mov r2, #0 @ j = 0
    ldr r3, =string @ grabs the address of string loads it into r3
    b loop

loop:
    ldrb r4, [r3], #1 @ grabs the char from r2 and stores it in r4
    cmp r4, #0 @ checks if we made it to the null
    beq bottom

    and r5, r4, #1 @ checks if even or odd
    cmp r5, #0 
    beq even @ if skipped assume its odd

odd:
    sub r4, #5 @ subtracts 5 from the char 
    strb r4, [r3,#-1] @ stores back the new value
    b continue

even:
    add r4, #5 @ adds 5 to the char
    strb r4, [r3, #-1] @ stores back the new value

continue:
    add r2, #1 @ increment j
    b loop


bottom:
    @ prints out our updated string
    ldr r1, =string
    mov r7, #4
    mov r0, #1 @ r2 is our j value or number of chars
    swi 0

    @ print new line
    ldr r1, =newline
    mov r7, #4
    mov r0, #1
    mov r2, #1
    swi 0
end:
    mov r7, #1
    swi 0

    .data
string:  /* 12345678901234567890 */
    .asciz "Kwjlmfhrdsb%atm%azi3" @ null terminated

newline:
    .asciz "\n"
