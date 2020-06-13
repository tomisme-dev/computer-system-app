#include <stdio.h>

long rproduct(long *start, long count)
{
    if (count <= 1)
        return 1;
    return *start * rproduct(start + 1, count - 1);
}


long push_test(long a) {
    return a*2;
}


int main(int argc, char const *argv[])
{
    printf("hello world, valu=%ld", push_test(18));
    push_test(18);
    return 0;
}
