li t0, 0x0000ffff
li t1, 0x0000abcd

and s0, t0, t1
andi s1, t0, -1984
or s0, t0, t1
ori s1, t0, -1984
xor s0, t0, t1
xori s1, t0, -1984

li t0, 0x10101010
li t1, 0x00001010

and s0, t0, t1
andi s1, t0, 1984
or s0, t0, t1
ori s1, t0, 1984
xor s0, t0, t1
xori s1, t0, 1984
