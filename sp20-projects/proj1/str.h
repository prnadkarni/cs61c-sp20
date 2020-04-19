#ifndef _STR_H_
#define _STR_H_ 

typedef struct String {
    char *buf;
    unsigned int cap;
    unsigned int len;
} String;

extern String *newString(int cap);

extern void stringPush(String *str, char c);

extern void stringDrop(String *str);

extern char *stringIntoBuf(String *str);
#endif
