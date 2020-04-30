.import ../read_matrix.s
.import ../utils.s

.data
file_path: .asciiz "./test_input.bin"

.text
main:
    # Read matrix into memory
    la s0, file_path

    li a0, 4
    jal ra, malloc
    mv s1, a0

    li a0, 4
    jal ra, malloc
    mv s2, a0

    mv a0, s0
    mv a1, s1
    mv a2, s2
    jal ra, read_matrix

    # Print out elements of matrix
    lw a1, 0(s1)
    lw a2, 0(s2)
    jal print_int_array

    # Print newline
    li a1 '\n'
    jal print_char

    # Terminate the program
    addi a0, x0, 10
    ecall
