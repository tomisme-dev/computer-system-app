#include <stdio.h>

int f(int n)
{
    int result = 1;
    do
    {
        int tmp = result;
        result *= n;
        if (result / tmp != n)
        {
            printf("n=%d, overflow\n", n);
            return -1;
        }
        n--;
    } while (n > 1);
    return result;
}

short dw_loop(short x)
{
    short y = x / 9;
    short *p = &x;
    short n = 4 * x;
    do
    {
        x += y;
        (*p) += 5;
        n -= 2;
    } while (n > 0);
    return x;
}

int main(int argc, char const *argv[])
{
    int b = 3 & 1;
    printf("bool=%d\n", b);
    return 0;
}

long fact_while(long n)
{
    long result = 1;
    while (n > 1)
    {
        result *= n;
        n = n - 1;
    }
    return result;
}

short test_one(unsigned short x)
{
    short val = 1;
    while (x != 0)
    {
        val = val ^ x;
        x >>= 1;
    }

    return val & 0;
}