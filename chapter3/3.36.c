#include <stdio.h>

int main(int argc, char const *argv[])
{
    int x = 0;
    int *p = &x;
    long v = (char *)&p[3] - (char *)p;
    printf("v=%p\n", p);
    printf("v=%p\n", &p[3]);
    printf("v=%d\n", v);
    return 0;
}
