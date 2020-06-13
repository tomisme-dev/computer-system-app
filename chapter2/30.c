#include <stdio.h>

int tadd_ok(int x, int y)
{
    int z = x + y;
    // printf("%d+%d=%d\n", x, y, z);
    return !((x > 0 && y > 0 && z <= 0) || (x < 0 && y < 0 && z >= 0));
}

int tsub_ok(int x, int y)
{
    int z = x - y;
    return !((x >= 0 && y < 0 && z <= 0) || (x < 0 && y > 0 && z >= 0));
    // return tadd_ok(x, -y);
}

int main(int argc, char const *argv[])
{
    int x1 = 0x80000000;
    // int x1 = 0;
    int x2 = 0x7fffffff;
    x2 = 0;
    int x3 = 1;
    int x4 = -1;
    printf("====================test tadd_ok=========================\n");
    printf("%d+%d %d\n", x1, x1, tadd_ok(x1, x1));
    printf("%d+%d: %d\n", x2, x2, tadd_ok(x2, x2));
    printf("%d+%d: %d\n", x1, x2, tadd_ok(x1, x2));

    printf("====================test tsub_ok=========================\n");
    printf("%d-%d=%d %d\n", x1, x1, x1-x1, tsub_ok(x1, x1));
    printf("%d-%d=%d %d\n", x2, x2, x2-x2, tsub_ok(x2, x2));
    printf("%d-%d=%d %d\n", x1, x2, x1-x2, tsub_ok(x1, x2));
    printf("%d-%d=%d %d\n", x2, x1, x2-x1, tsub_ok(x2, x1));

    return 0;
}
