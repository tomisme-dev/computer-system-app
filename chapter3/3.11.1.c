float float_mov(float v1, float *src, float *dst)
{
    float v2 = *src;
    *dst = v1;
    return v2;
}

double fcvt(int i, float *fp, double *dp, long *lp)
{
    float f = *fp;
    double d = *dp;
    *fp = (float)d;
    return (double)f;
}

double fcvt2(long *ip, float *fp, double *dp, long l)
{
    long i = *ip;
    float f = *fp;
    double d = *dp;
    *ip = (long)d;
    *fp = (float)i;
    *dp = (double)l;
    return (double)f;
}