.section .text
.global _start

_start:
    addi x1, x0, 5      # x1 = 5
    addi x2, x1, 1      # x2 = 6

loop:
    beq x0, x0, loop    # infinite loop