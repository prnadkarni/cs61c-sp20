# tests from part_a/alu-slt-sub-bsel

li t0, 4
li t1, 3
sub s0, t0, t1
sub s1, t1, t0
add s1, s1, s0

li t0, 0xfff00007
li t1, 0xfff00009
sub s0, t0, t1
sub s1, t1, t0
