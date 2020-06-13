#include <stdio.h>

int uadd_ok(unsigned x, unsigned y)
{
    unsigned z = x + y;
    return x <= z && y <= z;
}
int main(int argc, char const *argv[])
{
    printf("isOk: %d\n", uadd_ok(0xffffU, 0x12));
    return 0;
}
