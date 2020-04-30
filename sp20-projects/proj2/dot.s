.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 is the pointer to the start of v0
#   a1 is the pointer to the start of v1
#   a2 is the length of the vectors
#   a3 is the stride of v0
#   a4 is the stride of v1
# Returns:
#   a0 is the dot product of v0 and v1
# =======================================================
dot:
    # Prologue
    # t0: ans
    # t1: idx
    # t2, t3: tmp
    # a0: arr1
    # a1: arr2
    # a2：n
    # a3: stride1
    # a4: stride2
    li t0, 0
    li t1, 0


loop_start:
    beq a2, zero, loop_end
    addi a2, a2, -1
    mul t2, t1, a3   # t2 = arr1[t1 * stride1]
    slli t2, t2, 2
    add t2, t2, a0
    lw t2, 0(t2)
    mul t3, t1, a4   # t3 = arr2[t1 * stride2]
    slli t3, t3, 2
    add t3, t3, a1
    lw t3, 0(t3)
    mul t2, t2, t3
    add t0, t0, t2   # ans += t2 * t3
    addi t1, t1, 1
    j loop_start


loop_end:
    # Epilogue
    mv a0, t0
    ret
