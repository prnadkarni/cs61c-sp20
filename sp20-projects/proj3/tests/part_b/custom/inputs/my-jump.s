    jal ra label
    addi s0 x0 -1
    jal x0 end
label:
    jalr ra ra 0
end: 
    addi a0 x0 -1
