# ALU

w位的无符号乘法结果的低w位，就是补码乘法有符号表示，这个在CSAPP中有证明

本质上乘法就是把被乘数的倍数相加，每个倍数如果超过了w范围也看成是补码加法的自然溢出，没有影响。

所以乘法器的低w位结果是`mul0`和`mulu0`(因为相等所以未专门列出)，高位是`mulhu0`。

现在的问题是，怎么把无符号乘法的高w位，转换为有符号的表示，比如w=4



```c
1101 x 0101 = 0100 0001
13   x  5   = 64 + 1
-3   x  5   = -15  -> 1111 0001

这个例子中，mulh应该是1111，而不是0100


1101 x 0111 = 0101 1011
13   x  7   = 80 + 11
-3   x  7   = -21  -> 1110 1011

这个例子中，mulh应该是1110，而不是0101


1111 x 1111 = 1110 0001
15 x 15 = 224 + 1
-1 x -1 = 1
这个例子中，mulh应该是0000，而不是1110
```

这个过程也就是`i8(c) = (i4)a * (i4)b`，所以先用符号拓展，把a、b变为有符号的8位表示，然后再相乘，那么低8位自然就是有符号数了。但是因为每个寄存器只能存4位，所以乘法要分部做，然后把三个部分相加，效率有点低。
