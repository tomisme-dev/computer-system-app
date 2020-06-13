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


double get_double_by_long(long l)
{
    union 
    {
        long l;
        double d;
    } temp;
    temp.l = l;
    return temp.d;
}


unsigned long get_long_by_double(double d)
{
    union 
    {
        unsigned long l;
        double d;
    } temp;
    temp.d = d;
    return temp.l;
}


// int strlen(char *s)
// {
//     int i = 0;
//     while(s[i] != 0) {
//         i++;
//     }
//     return i;
// }

double get_double_by_2int(unsigned low, unsigned high)
{
    union 
    {
        struct
        {
            unsigned low;
            unsigned high;
        } int2;
        
        double d;
    } temp;
    temp.int2.low = low;
    temp.int2.high = high;
    return temp.d;
}

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
    // int x = -1;
    // unsigned u = 2147483648;
    // int bool = 2147483647 - 1U < -2147483647;
    // float f = 0.1F;
    // show_fload(f);
    // show_int(1024);
    printf("double=%f\n", get_double_by_2int(0, 1072693248u));
    printf("long=%lx\n", get_double_by_2int(0, 1072693248u));
    
    return 0;
}
