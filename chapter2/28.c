#include <stdio.h>

int main(int argc, char const *argv[])
{
    char a[5] = {1, 4, 7, 0xa, 0xe};
    for(int i = 0; i < 5; i++) {
        unsigned ux = a[i];
        unsigned m_ux = -ux;
        printf("a=%d, %u, %d\n", a[i], ux, m_ux);
        int min_int = -2147483648;
        printf("%u\n", min_int + min_int);
    }

    return 0;
}
