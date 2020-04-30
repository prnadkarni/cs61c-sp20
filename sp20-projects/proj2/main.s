.import read_matrix.s
.import write_matrix.s
.import matmul.s
.import dot.s
.import relu.s
.import argmax.s
.import utils.s

.globl main

.text
main:
    # =====================================
    # COMMAND LINE ARGUMENTS
    # =====================================
    # Args:
    #   a0: int argc
    #   a1: char** argv
    #
    # Usage:
    #   main.s <M0_PATH> <M1_PATH> <INPUT_PATH> <OUTPUT_PATH>

    # Exit if incorrect number of command line args
    li t0, 5
    bne t0, a0, incorrect_args_error

    # s0: char argv
    # s1: *m0
    # s2: *m1
    # s3: *input

    mv s0, a1
    addi sp, sp, -24
    

    # =====================================
    # LOAD MATRICES
    # =====================================


    # Load pretrained m0
    lw a0, 4(s0)
    addi a1, sp, 0
    addi a2, sp, 4
    jal ra, read_matrix
    mv s1, a0

    # Load pretrained m1
    lw a0, 8(s0)
    addi a1, sp, 8
    addi a2, sp, 12
    jal ra, read_matrix
    mv s2, a0


    # Load input matrix
    lw a0, 12(s0)
    addi a1, sp, 16
    addi a2, sp, 20
    jal ra, read_matrix
    mv s3, a0


    # =====================================
    # RUN LAYERS
    # =====================================
    # 1. LINEAR LAYER:    m0 * input
    # 2. NONLINEAR LAYER: ReLU(m0 * input)
    # 3. LINEAR LAYER:    m1 * ReLU(m0 * input)

  
    lw t0, 0(sp)    # m0's row
    lw t1, 20(sp)   # input's col
    mul s4, t0, t1  # hidden layer's size
    mv a0, s4
    jal ra, malloc
    beq a0, zero, mem_alloc_error
    mv s5, a0

    mv a0, s1      # m0
    lw a1, 0(sp)   # m0's row
    lw a2, 4(sp)   # m0's col

    mv a3, s3      # input
    lw a4, 16(sp)   # input's row
    lw a5, 20(sp)   # input's col

    mv a6, s5       # d in the heap
    jal ra, matmul

    li a1 'a'
    jal print_char


    mv a0, s5
    mv a1, s4
    jal ra, relu

    mv a0, s5
    lw a1, 0(sp)
    lw a2, 20(sp)
    jal ra, print_int_array



    # =====================================
    # WRITE OUTPUT
    # =====================================
    # Write output matrix
    lw a0 16(s0) # Load pointer to output filename





    # =====================================
    # CALCULATE CLASSIFICATION/LABEL
    # =====================================
    # Call argmax




    # Print classification
    



    # Print newline afterwards for clarity
    li a1 '\n'
    jal print_char




    jal exit


mem_alloc_error:
    li a1 2
    jal exit2

incorrect_args_error:
    li a1 3
    jal exit2
