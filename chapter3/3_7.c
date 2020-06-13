#include <stdio.h>

#include <inttypes.h>
typedef unsigned __int128 uint128_t;
void store_uprod(uint128_t *dest, uint64_t x, uint64_t y)
{
    *dest = x * (uint128_t)y;
}

long exchange(long *xp, long y)
{
    long x = *xp;
    *xp = y;
    return x;
}

long decode1(long *xp, long *yp, long *zp)
{
    long y = *yp;
    *yp = *xp;
    long z = *zp;
    *zp = y;
    *xp = z;
}

long scale(long x, long y, long z)
{
    long t = x + 4 * y + 12 * z;
    return t;
}

long shift_left4_rightn(long x, long n)
{
    x <<= 4;
    x >>= n;
    return x;
}

long arith(long x)
{
    long t1 = x;
    long t3 = t1 / 14;
    return t3;
}

long my_div(long a, long b)
{
    return a % b;
}

int main(int argc, char const *argv[])
{
    printf("result=%ld\n", arith(0xFFFFFFFFFFL));
    return 0;
}

void remdiv(unsigned long x, unsigned long y, unsigned long *qp, unsigned long *rp)
{
    unsigned long q = x / y;
    unsigned long r = x % y;
    *qp = q;
    *rp = r;
}