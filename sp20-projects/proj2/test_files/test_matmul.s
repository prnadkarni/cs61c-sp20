.import ../matmul.s
.import ../utils.s

# static values for testing
.data
m0: .word 1 2 3 4 5 6 7 8 9
m1: .word 1 2 3 4 5 6 7 8 9
d: .word 0 0 0 0 0 0 0 0 0 # allocate static space for output

.text
main:
    # Load addresses of input matrices (which are in static memory), and set their dimensions
    la s0, d
    la s1, m0
    la s2, m1
    li s3, 3
    li s4, 3
    li s5, 3
    li s6, 2


    # Call matrix multiply, m0 * m1
    mv a0, s1
    mv a1, s3
    mv a2, s4
    mv a3, s2
    mv a4, s5
    mv a5, s6
    mv a6, s0
    jal ra, matmul


    # Print the output (use print_int_array in utils.s)
    mv a0 s0
    mv a1 s3
    mv a2 s6
    jal print_int_array

    # Print newline
    li a1 '\n'
    jal print_char


    # Exit the program
    jal exit
