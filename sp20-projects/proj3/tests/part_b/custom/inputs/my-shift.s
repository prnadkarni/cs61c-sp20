# tests from part_a/alu-shift

li t0, 0xf234567f

li t1, 9
srl s0, t0, t1
srli s1, t0, 9
sra s0, t0, t1
srai s1, t0, 9
sll s0, t0, t1
slli s1, t0, 9

li t1, 0xfe9
srl s0, t0, t1
srli s1, t0, 0
sra s0, t0, t1
srai s1, t0, 1
sll s0, t0, t1
slli s1, t0, 3
