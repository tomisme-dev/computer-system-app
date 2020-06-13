long rfact(long n)
{
    long result;
    if (n <= 1)
        result = 1;
    else
        result = n * rfact(n - 1);
    return result;
}

long rfun(unsigned long x)
{
    if (x == 0)
    {
        return 0L;
    }
    unsigned long nx = x >> 3;
    long rv = rfun(nx);
    return x + rv;
}