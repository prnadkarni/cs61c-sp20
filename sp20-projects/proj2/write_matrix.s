.globl write_matrix

.text
# ==============================================================================
# FUNCTION: Writes a matrix of integers into a binary file
#   If any file operation fails or doesn't write the proper number of bytes,
#   exit the program with exit code 1.
# FILE FORMAT:
#   The first 8 bytes of the file will be two 4 byte ints representing the
#   numbers of rows and columns respectively. Every 4 bytes thereafter is an
#   element of the matrix in row-major order.
# Arguments:
#   a0 is the pointer to string representing the filename
#   a1 is the pointer to the start of the matrix in memory
#   a2 is the number of rows in the matrix
#   a3 is the number of columns in the matrix
# Returns:
#   None
# ==============================================================================
write_matrix:

    # Prologue
    addi sp, sp, -20
    sw, s0, 0(sp) # fd
    sw, s1, 4(sp) # a1
    sw, a2, 8(sp) # store n_row in stack
    sw, a3, 12(sp) # store n_col in stack
    sw, ra, 16(sp)

    mv s1, a1

    # open the file
    mv a1 a0
    li a2 1          # 'w' create + truncate + write
    jal ra, fopen
    blt a0, zero, eof_or_error
    mv s0, a0

    # write dim info
    mv a1 s0
    addi a2, sp, 8   # addr of n_row
    li a3, 1
    li a4, 4
    jal ra, fwrite
    li t0, 1
    bne a0, t0, eof_or_error

    mv a1 s0
    addi a2, sp, 12   # addr of n_col
    li a3, 1
    li a4, 4
    jal ra, fwrite
    li t0, 1
    bne a0, t0, eof_or_error

    # write matrix content
    lw t0, 8(sp)
    lw t1, 12(sp)
    mv a1, s0
    mv a2, s1
    mul a3, t0, t1
    li a4, 4
    jal ra, fwrite
    lw t0, 8(sp)
    lw t1, 12(sp)
    mul t0, t0, t1
    bne t0, a0, eof_or_error

    # close the file
    mv a1, s0
    jal ra, fclose
    blt a0, zero, eof_or_error

    # Epilogue
    lw, s0, 0(sp) # fd
    lw, s1, 4(sp) # a1
    lw, ra, 16(sp)
    addi sp, sp, 20
    ret

eof_or_error:
    li a1 1
    jal exit2
    