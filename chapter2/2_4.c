#include <stdio.h>
#include <string.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, size_t len)
{
    int i;
    for (i = 0; i < len; i++)
    {
        printf(" %.2x", start[i]);
    }
    printf("\n");
}

void show_int(int x)
{
    show_bytes((byte_pointer)&x, sizeof(int));
}

void show_fload(float x)
{
    show_bytes((byte_pointer)&x, sizeof(float));
}

void show_pointer(void *x)
{
    show_bytes((byte_pointer)&x, sizeof(void *));
}

// int strlen(char *s)
// {
//     int i = 0;
//     while(s[i] != 0) {
//         i++;
//     }
//     return i;
// }

int main(int argc, char const *argv[])
{
    // int a = 99;
    // int *p = &a;
    // show_pointer(p);
    // printf(">>> %p\n", p);
    // show_bytes("abcd", sizeof("abcd"));
    // char *m = "mnopqr";
    // printf("%ld\n", strlen(m));
    // show_bytes((byte_pointer)m, strlen(m));
    // short x = 12345;
    // short mx = -x;

    // show_bytes((byte_pointer)&x, sizeof(x));
    // show_bytes((byte_pointer)&mx, sizeof(mx));
    // printf("%d\n", (unsigned short)0xcfc7);
    // short s = -12345;
    // unsigned short us = (unsigned short)s;
    // printf("s=%d, us=%u\n", s, us);
    // printf("s=%x\n", x);
    int x = -1;
    unsigned u = 2147483648;
    int bool = 2147483647 - 1U < -2147483647;
    printf("x = %u = %d\n", x, x);
    printf("t = %u = %d\n", u, u);
    printf("bool=%d\n", bool);
    return 0;
}
