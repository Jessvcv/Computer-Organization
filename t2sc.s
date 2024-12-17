/*  CSC 2110, Computer Organization 
 *  Tutorial 2: Labels & Branch Instructions
 *  by Jessica Tran
 *  
 *  This function returns the smallest number that
 *  evenly divides n. If n is prime, it returns n.
 */
  .text
  .align  2
  .global factor
  .type   factor,function
  
factor:
  cmp x0, #2
  b.lt return_n

  mov x1, #2

loop: 
  mul x2, x1, x1
  cmp x2, x0
  b.gt return_n

  udiv x2, x0, x1
  msub x3, x2, x1, x0
  cbz x3, return_i

  add x1, x1, #1
  b loop

return_i: 
  mov x0, x1
  ret

return_n:
  ret

  .size  factor, . - factor
  .ident  "CSC 2110, Tutorial 2"
  .ident  "Jessica Tran"
