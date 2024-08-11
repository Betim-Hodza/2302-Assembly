/*
      Betim Hodza 1001928702
      program hw04a

      What is hardcoded 
      * array elements: 5, 1, 16, 200, 7, 20, 2, 21, 19, 3
      * number of array elements: 9 elements (starting from 0-9)

      What is needed to be done:
      * calculate the sum of each element that is less than 20 and store it in R0

      c-code
      int array = {elements}
      int i = 0
      int sum = 0;
      while(i <= 9)
      {
        if(array[i] < 20)
        {
            sum += array[i];
        }
      }
*/

    .global _start

_start:
    mov r1, #0 @ our i variable used in while loop
    mov r0, #0 @ sum = 0
    ldr r2, =array @ get address of array and puts it in r2
    b bottom
    
Loop:
    ldr r3, [r2], #4 @ grabs a value from array and shifts to the next spot in the array
    cmp r3, #20 @ if the value in r3 is < 20
    blt Addsum

    add r1, #1 @ i++
    b bottom

Addsum:
    add r0, r3 @ adds the number from array to the sum
    add r1, #1 @ i++


bottom:
    cmp r1, #10 @ comparings if i < 10 (the array size is 9 elements 0-9 )
    blt Loop

end:
    mov r7, #1
    swi 0


    .data
array:
    .word 5, 1, 16, 200, 7, 20, 2, 21, 19, 3
