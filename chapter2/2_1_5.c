#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int sum(int x, int y)
{
    return x + y;
}

int my_equals2(int x, int y)
{
    return !(x ^ y);
}


int main(int argc, char const *argv[])
{
    // int b = my_equals2(3, 4);
    __uint64_t a = 0xffffffffffffffff;
    long b = 0xffffffffffffffffL;
    printf("arithmetic: %lx\n", b);
    return 0;
}
