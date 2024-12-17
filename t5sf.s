/* CSC 2110, Computer Organization
 * Tutorial 5: Shift Operations
 * by Jessica Tran
 *
 * void IntToHex(int N, char* S) copies into 
 * string S the hexadecimal representation of N
 *
 */
  .text
  .align  2
  .global IntToHex
  .type   IntToHex, function

IntToHex:
  stp     x29, x30, [sp, #-16]!  // Save frame pointer and link register
  mov     x29, sp                // Set frame pointer

  sub     sp, sp, #32            // Allocate space on the stack for 32 bytes
  mov     x2, sp                 // x2 points to temporary buffer (reverse order)
  mov     x3, #0                 // Initialize digit counter

loop:
  and     w4, w0, #15            // Mask the last 4 bits of N (hex digit)
  cmp     w4, #9
  add     w4, w4, #'0'           // Convert to ASCII if 0-9
  b.le    store_digit
  add     w4, w4, #('A' - '9' - 1) // Convert to ASCII if A-F

store_digit:
  strb    w4, [x2, x3]           // Store digit in reverse order in the buffer
  add     x3, x3, #1             // Increment digit counter
  lsr     w0, w0, #4             // Shift N right by 4 bits (next hex digit)
  cbnz    w0, loop               // Continue if N is not zero

  mov     x4, #0                 // Initialize index for final string S

reverse_copy:
  sub     x3, x3, #1             // Move index backwards in the buffer
  ldrb    w5, [x2, x3]           // Load character from buffer
  strb    w5, [x1, x4]           // Store it in string S
  add     x4, x4, #1             // Increment index for S
  cbnz    x3, reverse_copy       // Repeat until all digits are copied

  strb    wzr, [x1, x4]          // Null-terminate the string

  add     sp, sp, #32            // Deallocate stack space
  ldp     x29, x30, [sp], #16    // Restore frame pointer and link register
  ret

  .size   IntToHex, . - IntToHex
  .ident  "CSC 2110, Tutorial 5 "
  .ident  "Jessica Tran"
