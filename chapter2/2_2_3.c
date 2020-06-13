#include <stdio.h>
#include <string.h>

int fun1(unsigned word)
{
    return (int)((word << 24) >> 24);
}

int fun2(unsigned word)
{
    return ((int)word << 24) >> 24;
}

int strlonger(char *s, char *t) {
    return strlen(s) > strlen(t);
}
int main(int argc, char const *argv[])
{
    unsigned w = 0xEDCBA987;
    printf("fun1=%x, fun2=%x\n", fun1(w), fun2(w));
    printf("%d\n", strlonger("abc", "abcd"));
    return 0;
}
