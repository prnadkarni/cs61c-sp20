# lui s0, 0xdeadc
# addi s0, s0, 0xeef
# venus will throw error: immediate 0xeef (= 3823) out of range (should be between -2048 and 2047)
# so we have to convert it to negative form
# addi s0, s0, -0x111

# it will work well, but we can do it better
li s0, 0xdeadbeef
