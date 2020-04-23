#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg) {
    uint16_t x = *reg;
    x = (x & 0x1) ^ ((x >> 2) & 0x1) ^ ((x >> 3) & 0x1) ^ ((x >> 5) & 0x1);
    *reg = (*reg >> 1) | (x << 15);
}

