#include<stdio.h>

void addvec(int *x, int *y, int *z, int n);
void mulvec(int *x, int *y, int *z, int n);

int main(int argc, char const *argv[])
{
    int a[] = {1,2};
    int b[] = {10, 11};
    int c[] = {0, 0};
    mulvec(a, b, c, 2);
    printf("c[1]=%d\n", c[1]);
    return 0;
}
