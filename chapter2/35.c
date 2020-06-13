#include <stdio.h>

int tmul_ok(int x, int y)
{
    int z = x * y;
    return !x || z / x == y;
}

int main(int argc, char const *argv[])
{
    for (int i = 46341; i < 2147483647; i++)
    {
        if (tmul_ok(i, i))
        {
            printf("%d\n", i);
            break;
        }
    }
    // printf("%d\n", tmul_ok(46340, 46340));
    printf("finish");
    return 0;
}
