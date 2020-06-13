#include <stdio.h>
int main()
{
    double a = (3.14 + 1e20) - 1e20;
    char* s = "bac";
    int size = sizeof(s);
    unsigned int b = 0x66;
    signed char c2 = '\t';
    __int64_t i64 = 0xffffffffffffffffL;
    printf("hello %f, %p, %d, %ld\n", a, s, size, i64);

    return 0;
}