.globl matmul

.text
# =======================================================
# FUNCTION: Matrix Multiplication of 2 integer matrices
# 	d = matmul(m0, m1)
#   If the dimensions don't match, exit with exit code 2
# Arguments:
# 	a0 is the pointer to the start of m0
#	a1 is the # of rows (height) of m0
#	a2 is the # of columns (width) of m0
#	a3 is the pointer to the start of m1
# 	a4 is the # of rows (height) of m1
#	a5 is the # of columns (width) of m1
#	a6 is the pointer to the the start of d
# Returns:
#	None, sets d = matmul(m0, m1)
# =======================================================
matmul:

    # Error if mismatched dimensions
    bne a2, a4, mismatched_dimensions


    # Prologue
    addi sp, sp, -36
    sw, s0, 0(sp)  # a0
    sw, s1, 4(sp)  # a1
    sw, s2, 8(sp)  # a2 == a4
    sw, s3, 12(sp) # a3
    sw, s4, 16(sp) # a5
    sw, s5, 20(sp) # a6
    sw, s6, 24(sp) # i
    sw, s7, 28(sp) # j
    sw, ra, 32(sp) # ra
    li s6, 0
    mv s0, a0
    mv s1, a1
    mv s2, a2
    mv s3, a3
    mv s4, a5
    mv s5, a6





outer_loop_start:
    bge s6, s1, outer_loop_end
    li s7, 0         # j = 0
    j inner_loop_start



inner_loop_start:
    bge s7, s4, inner_loop_end

    mul t0, s6, s2   # row_idx = i * a2
    slli t0, t0, 2
    add t0, t0, s0
    mv a0, t0
    mv a2, s2        # dotmul length = a2
    li a3, 1         # stride of v0 = 1

    slli t1, s7, 2   # col_idx = j
    add t1, t1, s3
    mv a1, t1
    mv a4, s4        # stride of v1 = columns of matrix1

    jal ra dot
    mul t0, s4, s6   # d_idx = i * a5 + j   (dim of d: a1 x a5)
    add t0, t0, s7
    slli t0, t0, 2
    add t0, t0, s5
    sw a0, 0(t0)     # d[idx] = dot(row, col)
    addi s7, s7, 1   # j += 1
    j inner_loop_start


inner_loop_end:
    addi s6, s6, 1   # i += i
    j outer_loop_start


outer_loop_end:

    # Epilogue
    mv a0, s0
    mv a1, s1
    mv a2, s2
    mv a4, s2
    mv a3, s3
    mv a5, s4
    mv a6, s5
    lw, s0, 0(sp)  # a0
    lw, s1, 4(sp)  # a1
    lw, s2, 8(sp)  # a2 == a4
    lw, s3, 12(sp) # a3
    lw, s4, 16(sp) # a5
    lw, s5, 20(sp) # a6
    lw, s6, 24(sp) # i
    lw, s7, 28(sp) # j
    lw, ra, 32(sp)
    addi sp, sp, 36
    ret


mismatched_dimensions:
    li a1 2
    jal exit2
