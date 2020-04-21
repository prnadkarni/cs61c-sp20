#include <stdio.h>
int main() {
    int a[5] = {1, 2, 3, 4, 5};
    unsigned total = 0;
    // loop 20 times
    for (int j = 0; j < sizeof(a); j++) {
        total += a[j];
    }
    printf("sum of array is %d\n", total);
}
