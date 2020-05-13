1. hints
- Why do we need to save stuff on the stack before we call jal?  
    s0、s1是Callee save 的寄存器，必须保证返回时和开始时值不变，对Caller的保证  
    ra是Caller save的寄存器，因为map会调用子程序，子程序可能改变它的值，调用者需要自己保存
- What’s the difference between add t0, s0, x0 and lw t0, 0(s0)?  
    前者寄存器加法，后者是内存取值
- Pay attention to the types of attributes in a struct node.  
    12字节，0处为数组指针，4处int，8处node指针
- Note: you need only focus on map, mapLoop, and done functions but it’s worth understanding the full program.
- Note: you may not use any s registers outside of s0 and s1.

2. 不能用s2~s11
3. 列出错误  
    1. 数组指针的加载应该是`lw t1, 0(s0)` 
    2. t1等临时变量在调用前没有保存，在mystery中也是用了t1，返回时导致意外值
    3. 对数组的索引没有按照sizeof(int)递增
    4. `la a0, 8(s0)` 应该是 `lw a0, 8(s0)`，要的是指向堆的指针值，不是指令段端的位置
    5. `lw a1, 0(s1)` 应该是 `mv a1, s1`，a1寄存器已经是mystery段的指令地址了


