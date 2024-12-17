/* CSC 2110, Computer Organization
 * Tutorial 9: Floating-Point Instructions
 * Version 4: Use Vector Operations
 * by Jessica Tran
 *
 * float SSum(double X[], int N);
 * This function adds the inputs in the X array using vector operations
 */
  .text
  .align  2
  .global SSum
  .type SSum, %function
  
SSum:
  fmov s0, wzr               
  cbz w1, end                

  movi v0.4s, #0              

loop:
  ld1 {v1.4s}, [x0], #16      
  fadd v0.4s, v0.4s, v1.4s    

  subs w1, w1, #4             
  b.gt loop                   

  faddp v1.4s, v0.4s, v0.4s          
  faddp s0, v1.2s             

end:
  ret                         


  .size SSum, .-SSum
  .ident  "CSC 2110, Tutorial D, Mod 4 "
  .ident  "Jessica Tran"
