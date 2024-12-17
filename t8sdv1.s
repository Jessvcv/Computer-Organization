/* CSC 2110, Computer Organization
 * Tutorial 9: Floating-Point Instructions
 * Version 1: Eliminate unnecessary moves
 * by Jessica Tran

 * float SSum(double X[], int N);
 * This function adds the inputs in the X array
 */
  .text
  .align  2
  .global SSum
  .type SSum, %function
  
SSum:
  fmov s0, wzr
  cbz w1, end

loop:
  ldr s1, [x0], #4
  fadd s0, s0, s1
  subs w1, w1, #1
  b.gt loop

end:
  fmov s0, s0
  ret

  .size SSum, .-SSum
  .ident  "CSC 2110, Tutorial B, Mod 1 "
  .ident  "Jessica Tran"
