#include "hashtable.h"
#include <stdlib.h>
#include <stdio.h>

unsigned int
hashIntFunction(void *key)
{
    int *k = (int *)key;
    return (unsigned int)*k;
}

int equalIntFunction(void *k1, void *k2)
{
    int *px = (int *)k1;
    int *py = (int *)k2;
    return *px == *py;
}

void intCheck(HashTable *table, int *key, int expected)
{
    int output = *(int *)findData(table, (void *)key);
    if (output != expected)
    {
        printf("check failed, input: %d, output: %d, expected: %d\n", *key, output, expected);
        exit(1);
    }
}

int main(int argc, char **argv)
{
    HashTable *table = createHashTable(8, hashIntFunction, equalIntFunction);
    int k1 = 1, d1 = 11, k2 = 2, d2 = 22, k3 = 9, d3 = 99;
    insertData(table, (void *)&k1, (void *)&d1);
    insertData(table, (void *)&k2, (void *)&d2);
    insertData(table, (void *)&k3, (void *)&d3);
    intCheck(table, &k1, 11);
    intCheck(table, &k2, 22);
    intCheck(table, &k3, 99);
    printf("All passed!\n");
}
