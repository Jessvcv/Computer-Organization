/* CSC 2110, Computer Organization 
 * Tutorial 3: Addressing Modes I
 * by Jessica Tran

 * extern "C" long int compare(char s[], char t[]);
 * This procedure compares two strings.
 */
  .text
  .align  2
  .global compare
  .type compare,function  //sample

compare:

loop:
  ldrb w2, [x0], #1
  ldrb w3, [x1], #1

  cmp w2,w3
  beq check_end

  cmp w2, #0
  beq equal
  cmp w3, #0
  beq greater

  blt less
  bgt greater

check_end:
  cmp w2, #0
  beq equal
  b loop

equal:
  mov w0, #0
  ret 

greater: 
  mov w0, #1
  ret

less:
  mov w0, #-1
  ret

  .size compare, . - compare
  .ident  "CSC 2110, Tutorial 3 "
  .ident  "Jessica Tran"
