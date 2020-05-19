# tests from part_a/alu-div-rem

li t0, 0xffffbeef
li t1, 6
divu s0, t0, t1
divu s1, t1, t0

li t0, 1
li t1, 5
remu s0, t0, t1
li t0, 0xf8adbcd3
li t1, 2
remu a0, t0, t1
