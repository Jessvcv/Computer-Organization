   .arch armv8.2-a+crypto+crc
   .file "t0sh.c"
   .text
   .align   2
   .global  perm
   .type perm, %function

perm:
  
   cbz x1, base

   stp   x29, x30, [sp, -32]!
   mov   x29, sp
   str   x0, [sp, 24]
   sub x0, x0, #1
   sub x1, x1, #1

   bl perm

   ldr   x2, [sp, 24]
   mul x0, x2, x0

   ldp   x29, x30, [sp], 32
   ret

   base:
   mov x0, #1
   ret

   .size perm, .-perm
   .ident   "GCC: (GNU) 11.4.1 20230605 (Red Hat 11.4.1-2)"
   .section .note.GNU-stack,"",@progbits
