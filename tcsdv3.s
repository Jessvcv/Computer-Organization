/* CSC 2110, Computer Organization
 * Tutorial 9: Floating-Point Instructions
 * Version 3: Remove Stalls
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
  ldr s2, [x0], #4
  ldr s3, [x0], #4
  ldr s4, [x0], #4

  subs w1, w1, #4

  fadd s1, s1, s2
  fadd s3, s3, s4
  fadd s1, s1, s3
  fadd s0, s0, s1
  
  b.gt loop

end:
  fmov s0, s0
  ret

  .size SSum, .-SSum
  .ident  "CSC 2110, Tutorial B, Mod 3 "
  .ident  "Jessica Tran"
