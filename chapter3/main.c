#include <stdio.h>

void multstore(long, long, long *);

int main(int argc, char const *argv[])
{
    long d=9;
    long *p = &d;
    (*p)++;

    printf("d=%ld\n", *p);
    return 0;
}


long mult2(long a, long b) 
{
    return a * b;
}