.globl read_matrix

.text
# ==============================================================================
# FUNCTION: Allocates memory and reads in a binary file as a matrix of integers
#   If any file operation fails or doesn't read the proper number of bytes,
#   exit the program with exit code 1.
# FILE FORMAT:
#   The first 8 bytes are two 4 byte ints representing the # of rows and columns
#   in the matrix. Every 4 bytes afterwards is an element of the matrix in
#   row-major order.
# Arguments:
#   a0 is the pointer to string representing the filename
#   a1 is a pointer to an integer, we will set it to the number of rows
#   a2 is a pointer to an integer, we will set it to the number of columns
# Returns:
#   a0 is the pointer to the matrix in memory
# ==============================================================================
read_matrix:

    # Prologue
    addi sp, sp, -24

    sw s0, 0(sp) # fd
    sw s1, 4(sp) # a1
    sw s2, 8(sp) # a2
    sw s3, 12(sp) # mat_pointer
    sw s4, 16(sp) # mat_size
    sw ra, 20(sp)

    mv s1, a1
    mv s2, a2

    # open file
    mv a1, a0
    li a2, 0
    jal ra, fopen
    blt a0, zero, eof_or_error
    mv s0, a0

    # read n_row
    mv a1, s0
    mv a2, s1
    li a3, 4
    jal ra, fread
    li t0, 4
    bne a0, t0, eof_or_error

    # read n_col
    mv a1, s0
    mv a2, s2
    li a3, 4
    jal ra, fread
    li t0, 4
    bne a0, t0, eof_or_error

    # malloc the matrix
    lw t0, 0(s1)
    lw t1, 0(s2)
    mul t0, t0, t1
    slli s4, t0, 2
    mv a0, s4
    jal ra, malloc
    beq a0, zero, eof_or_error # NULL pointer
    mv s3, a0

    # read the matrix
    mv a1, s0
    mv a2, s3
    mv a3, s4
    jal ra, fread
    bne a0, s4, eof_or_error

    # close the file
    mv a1, s0
    jal ra, fclose
    blt a0, zero, eof_or_error

    # Epilogue
    mv a0, s3
    lw s0, 0(sp) # fd
    lw s1, 4(sp) # a1
    lw s2, 8(sp) # a2
    lw s3, 12(sp) # mat_pointer
    lw s4, 16(sp) # mat_size
    lw ra, 20(sp)
    addi sp, sp, 24
    ret

eof_or_error:
    li a1 1
    jal exit2
    