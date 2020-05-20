    li t0, 10
    li s1, 1
    li s0, 1
    jal ra, next
next:
    beq t0, x0, end
    add s0, s0, s1
    addi t0, t0, -1
    jalr ra, x0, 12  # jump to lable 'next' again
end:
    addi x0, x0, 1
