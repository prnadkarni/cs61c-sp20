# tests from part_a/alu-mulh.circ
li t0, 0x7435daa4
li t1, 0x62381add
mul s0, t0, t1
mulh s1, t0, t1
mulhu a0, t0, t1

li t0, 0xffffdead
li t1, 0xffffbeef
mul s0, t0, t1
mulh s1, t0, t1
mulhu a0, t0, t1

li t0, 0xffffdead
li t1, 0x63234d49
mul s0, t0, t1
mulh s1, t0, t1
mulhu a0, t0, t1

li t0, 0xefffffff
li t1, 0xac273deb
mul s0, t0, t1
mulh s1, t0, t1
mulhu a0, t0, t1
