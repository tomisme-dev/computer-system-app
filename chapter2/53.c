#include <stdio.h>
#define POS_INFINITY 0x7f800000u
#define NEG_INFINITY 0xff800000u
#define NEG_ZERO 0x80000000u

int main(int argc, char const *argv[])
{
    unsigned int i = 0x3dcccccdu; 
    // unsigned int i = NEG_ZERO;
    int *p = &i;
    float *p2 = p;
    unsigned char *pc = p;
    printf("%.20f\n", *p2);
    printf("%d\n", *p);
    printf("%d\n", POS_INFINITY);
    float convert_to_int = 12.99f;
    int after_int = (int) convert_to_int;
    printf("int=%d\n", after_int);
    printf("p=%p\n", p);
    printf("%.2x\n", pc[1]);
    return 0;
}
