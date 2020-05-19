li s0, 0x10000008
li s1, 5

li t0, -123
sw t0, 0(s0)
li t0, -23
sw t0, 4(s0)
li t0, 123
sw t0, 8(s0)
li t0, 11 
sw t0, 12(s0)
li t0, 123
sw t0, 16(s0)


loop_start:
    beq s1, zero, loop_end  # loop when s1 > 0
    addi s1, s1, -1         # idx = s0 + (s1-1) * 4
    slli t0, s1, 2
    add t0, t0, s0
    lw, t1, 0(t0)           # load s0[idx]
    blt x0, t1, loop_continue
    sw, zero, 0(t0)

loop_continue:
    jal zero, loop_start

loop_end:
    # Epilogue end
    addi, x0, x0, 0
