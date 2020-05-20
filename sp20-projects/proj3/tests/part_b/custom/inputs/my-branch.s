    beq s0 s0 start      #0  beq taken
bad-loop:
    addi sp sp -1
    beq x0 x0 bad-loop

label4:
    beq s0, s1, bad-loop #3   beq not taken
    bne s0, s1, end      #4   bne taken
    jal x0, bad-loop

start:
    addi s1 s1 10
    blt s0 s1 label1     #7   blt taken
    beq x0 x0 bad-loop

label2:
    addi s1 s1 -20
    bltu s0 s1 label3    #10  bltu taken
    beq x0 x0 bad-loop

label1:
    addi s0 s0 20
    blt s0 s1 bad-loop   #13   blt not taken
    jal x0, label2

label3:
    li s0, -20
    li s1, -10
    bltu s1, s0 bad-loop  #17  bltu not taken
    jal x0, label4

end:
    bne x0, x0, bad-loop  #19  bne not taken
    add a0 x0 x0

