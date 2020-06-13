#include<stdio.h>

int f()
{
    static int x = 10;
    x++;
    // printf("f...x=%d\n", x);
    return x;
}

int g()
{
    static int x = 12;
    x++;
    // printf("g...x=%d\n", x);
    return x;
}

int test(int x) {
    x = x == 4;
    return x;
}


int main(int argc, char const *argv[])
{
    f();
    f();
    f();
    g();
    return 0;
}
