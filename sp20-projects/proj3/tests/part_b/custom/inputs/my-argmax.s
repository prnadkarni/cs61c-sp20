# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#   element. If there are multiple, return the one
#   with the smallest index.
# Arguments:
#   s0 is the pointer to the start of the vector
#   s1 is the # of elements in the vector
# Returns:
#   a0 is the first index of the largest element
# =================================================================

li s0, 0x10000008
li s1, 5

li t0, -123
sw t0, 0(s0)
li t0, -23
sw t0, 4(s0)
li t0, 123
sw t0, 8(s0)
li t0, 11 
sw t0, 12(s0)
li t0, 123
sw t0, 16(s0)


argmax:
    # Prologue
    # t0: ans
    # t1: max_now
    # s1: n
    # s0: arr
    li t1, 0   # 0x00000313
    li t0, 0   # 0x00002913

loop_start:
    beq s1, zero, loop_end
    addi s1, s1, -1           # n -= 1
    slli t2, s1, 2            # tmp = arr[n]
    add t2, t2, s0
    lw t2, 0(t2)
    blt t2, t1, loop_continue
    mv t1, t2                 # tmp >= max_now, update max_now and ans
    mv t0, s1

loop_continue:
    j loop_start

loop_end:
    # Epilogue
    add a0, t0, zero
