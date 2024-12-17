/* CSC 2110, Computer Organization 
 * Tutorial 1: Introduction to Assembly
 * by Jessica Tran
 *
 * This function returns the remainder of
 * n divided by d.
 * 
 */
  .text
  .align  4
  .global remain
  .type remain, %function

remain:
  sdiv x2, x0, x1
  mul x2, x2, x1
  sub x0, x0, x2
  ret
  
  .size remain, .-remain
  .ident  "GCC: (SUSE Linux) 4.8.5"
  .ident  "Jessica Tran, CSC 2110, t1sd"
  .section  .note.GNU-stack,"",%progbits
  