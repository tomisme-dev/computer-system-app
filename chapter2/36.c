#include <stdio.h>

int tmul_ok(int x, int y)
{
    __int64_t p = (long)x * (long)y;
    // printf("%d*%d=p=%ld\n", x, y, p);
    return p >= -2147483648 && p < 2147483648;
}
int main(int argc, char const *argv[])
{
    int x1 = 1073741824;
    int x2 = -2147483648;
    int x3 = 2147483647;
    int x4 = -2147483647;
    int x5 = 46340;
    printf("%d * %d, %d\n", x5, x5, tmul_ok(x5, x5));
    printf("%d, %d\n", 5/-2, -5 >> 1);
    return 0;
}
