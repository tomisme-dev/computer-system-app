#include <stdio.h>
int f(int a, int b)
{
    return a+b;
}

int fun_call(int (*fun)(int, int), int a, int b)
{
    return fun(a, b);
}

int main(int argc, char const *argv[])
{
    int (*b)(int, int) = f;
    int c = b(9, 10);
    // printf("f=%p,b=%p\n", f, b);
    printf("%d\n",  c);
    return 0;
}
