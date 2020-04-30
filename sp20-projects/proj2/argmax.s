.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 is the pointer to the start of the vector
#	a1 is the # of elements in the vector
# Returns:
#	a0 is the first index of the largest element
# =================================================================
argmax:
    # Prologue
    # t0: ans
    # t1: max_now
    # a1: n
    # a0: arr
    li t1, 0
    li t0, 0

loop_start:
    beq a1, zero, loop_end
    addi a1, a1, -1           # n -= 1
    slli t2, a1, 2            # tmp = arr[n]
    add t2, t2, a0
    lw t2, 0(t2)
    blt t2, t1, loop_continue
    mv t1, t2                 # tmp >= max_now, update max_now and ans
    mv t0, a1

loop_continue:
    j loop_start


loop_end:
    # Epilogue
    add a0, t0, zero
    ret
