#include <stdlib.h>
#include <time.h>
#include <stdio.h>

/* Compute prefix sum of vector a */
void psum1(float a[], float p[], long int n)
{
    long int i;
    p[0] = a[0];
    for (i = 1; i < n; i++)
        p[i] = p[i - 1] + a[i];
}

void psum2(float a[], float p[], long int n)
{
    long int i;
    p[0] = a[0];
    float s = a[0];
    for (i = 1; i < n; i++) {
        s += a[i];
        p[i] = s;
    }
}

int main(int argc, char const *argv[])
{
    int len = 100;
    float a[len];
    float p[len];
    srand((unsigned)time(NULL));
    for(int i = 0; i < len; i++) {
        int b = rand();
        a[i] = b * 0.01;
        p[i] = b * 0.011;
    }

    psum1(a, p, len);
    return 0;
}
