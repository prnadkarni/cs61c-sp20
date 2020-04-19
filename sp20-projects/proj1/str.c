#include "str.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

const int INIT_SIZE = 100;
String *newString(int cap)
{
    String *str = malloc(sizeof(String));
    str->cap = cap == -1 ? INIT_SIZE : cap;
    str->len = 0;
    char *buf = malloc(sizeof(char) * INIT_SIZE);
    buf[0] = '\0';
    str->buf = buf;
    return str;
}

void stringPush(String *str, char c)
{
    if (str->len >= str->cap - 1)
    {
        printf("Expand!");
        unsigned int new_cap = str->cap * 2;
        char *buf = malloc(sizeof(char) * new_cap);
        strcpy(buf, str->buf);
        free(str->buf);
        str->buf = buf;
        str->cap = new_cap;
        // the space grew, push again now
        stringPush(str, c);
    }
    else
    {
        str->buf[str->len++] = c;
        str->buf[str->len] = '\0';
    }
}

void stringDrop(String *str) {
    free(str->buf);
    free(str);
}

char *stringIntoBuf(String *str) {
    char *ret = str->buf;
    free(str);
    return ret;
}

