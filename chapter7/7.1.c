#include <stdio.h>

int a = 0xffff;

int main(int argc, char const *argv[])
{
    a = a + 10;
    printf("a=%d", a);
    return 0;
}
