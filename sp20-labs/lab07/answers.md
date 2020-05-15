## Ex1 non-pipelined

Click-to-Q + CL-delay + setup

10 + 60 + 45 + 10 = 125ns -> 8MHz


## Ex2 pipelined


10 + 60 + 10 = 80ns -> 12.5 MHz

教材中的加bubbles，是因为存在写回，后面的指令复用了寄存器。这里没有复用、没有写回，中间的寄存器单纯地作为减少CL传播延时的道具
