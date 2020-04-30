.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 is the pointer to the array
#	a1 is the # of elements in the array
# Returns:
#	None
# ==============================================================================
relu:
    # Prologue

loop_start:
    beq a1, zero, loop_end  # loop when a1 > 0
    addi a1, a1, -1         # idx = s0 + (a1-1) * 4
    slli t0, a1, 2
    add t0, t0, a0
    lw, t1, 0(t0)           # load a0[idx]
    bge t1, zero, loop_continue
    sw, zero, 0(t0)

loop_continue:
    jal zero, loop_start

loop_end:
    # Epilogue
    ret
