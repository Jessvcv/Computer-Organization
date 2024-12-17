/* CSC 2110, Computer Organization
 * Tutorial 4: Addressing Modes II
 * by Jessica Tran
 *
 * CopyScores(int N, short int S[],
 *            record R[]);
 * copies N scores from array R into array S
 */
  .text
  .align  2
  .global CopyScores
  .type CopyScores,function

CopyScores: 
  cmp x3, #0

loop:
  cmp x3, x0
  beq done

  mov x5, #20
  mul x5, x3, x5
  add x5, x5, #14
  add x5, x2, x5

  ldrh w4, [x5]

  strh w4, [x1,x3, LSL #1]

  add x3, x3, #1

  b loop

done:
  ret

  .size CopyScores, . - CopyScores
  .ident  "CSC 2110, Tutorial 4 "
  .ident  "Jessica Tran"
