.section .text
.global _start

_start:
    # ----------------------------
    # I-TYPE (addi, ori, andi, slti)
    # ----------------------------
    
    addi x1, x0, 5          # x1 = 5
    addi x2, x0, 10         # x2 = 10
    ori  x3, x1, 3          # x3 = 5 | 3 = 7
    andi x4, x2, 6          # x4 = 10 & 6 = 2
    slti x5, x1, 6          # x5 = (5 < 6) = 1

    # ----------------------------
    # R-TYPE
    # ----------------------------
    add  x6, x1, x2         # x6 = 5 + 10 = 15
    sub  x7, x2, x1         # x7 = 10 - 5 = 5
    and  x8, x1, x2         # x8 = 5 & 10 = 0
    or   x9, x1, x2         # x9 = 5 | 10 = 15
    slt  x10, x2, x1        # x10 = (10 < 5) = 0

    # ----------------------------
    # MEMORY (sw, lw)
    # ----------------------------
    addi x11, x0, 100       # base address = 100

    sw   x6, 0(x11)         # MEM[100] = 15
    sw   x7, 4(x11)         # MEM[104] = 5

    lw   x12, 0(x11)        # x12 = 15
    lw   x13, 4(x11)        # x13 = 5

    # ----------------------------
    # BRANCH (beq)
    # ----------------------------
    beq  x12, x6, equal     # should branch (15 == 15)

    addi x14, x0, 999       # should be skipped

equal:
    addi x14, x0, 1         # x14 = 1

    # ----------------------------
    # JUMP (jal)
    # ----------------------------
    jal  x15, jump_target   # jump, x15 = return addr

    addi x16, x0, 999       # should be skipped

    addi x16, x0, 111       # skipped asswell

jump_target:
    addi x16, x0, 42        # x16 = 42

    # ----------------------------
    # INFINITE LOOP
    # ----------------------------
loop:
    beq x0, x0, loop