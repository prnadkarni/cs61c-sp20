
li t0, 0xffffabcd
li t1, 5
li t2, 0xffffabcd
li a0, 0xffffabcc
slt s0, t0, t1
slt s0, t0, t2
slt s0, t0, a0

li sp, -1
slti s1, sp, 5
slti s1, sp, -1
slti s1, sp, -3

