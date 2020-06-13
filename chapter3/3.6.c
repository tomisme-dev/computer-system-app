#define data_t long

int comp(int a, int b)
{
    return a > b;
}

int test(data_t a)
{
    return a != 0;
}

long lt_cnt = 0;
long ge_cnt = 0;
long absdiff_se(long x, long y)
{
    long result;
    if (x < y)
    {
        lt_cnt++;
        result = y - x;
    }
    else
    {
        ge_cnt++;
        result = x - y;
    }
    return result;
}

void cond(short a, short *p)
{
    if (a && *p < a)
        *p = a;
}

short f2(short x, short y, short z)
{
    short val = x + y - z;
    if (z > 5)
    {
        if (y > 2)
        {
            val = x / z;
        }
        else
        {
            val = x / y;
        }
    }
    else if (z < 3)
    {
        val = z / y;
    }

    return val;
}

long absdiff(long x, long y)
{
    long result;
    if (x < y)
        result = y - x;
    else
        result = x - y;
    return result;
}

long cread(long *x, long *y)
{
    return (*x > *y ? ((*x)++) - *y : ((*y)++) - *x);
}

long cread2(long *xp)
{
    return (xp ? *xp : 0);
}