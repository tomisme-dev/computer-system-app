#include <unistd.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdio.h>


int main(int argc, char const *argv[])
{


    int *ptr1 = malloc(512*4);
    printf("ptr1=%p\n", ptr1);

    // free(ptr1);

    int *ptr2 = malloc(256*4);
    printf("ptr2=%p\n", ptr2);
    ptr2 = malloc(256*4);
    printf("ptr2=%p\n", ptr2);
    ptr2 = malloc(1);
    printf("ptr2=%p\n", ptr2);
    ptr2 = malloc(1);
    printf("ptr2=%p\n", ptr2);
    ptr2 = malloc(1);
    printf("ptr_val = %d\n", *(ptr2-8));
    printf("ptr2=%p\n", ptr2);

    // ptr = malloc(64);
    // printf("ptr=%p\n", ptr);
    // ptr = malloc(1024*sizeof(int));
    // printf("ptr=%p\n", ptr);

    // brk_old = sbrk(64);
    // printf("before brk=%p\n", brk_old);

    while (1)
    {

    }
    

    // int *brk2 = sbrk(-4);
    // *(brk_old+10250) = 666;
    // printf("brkval=%d\n", *(brk_old+1));
    // printf("before brk2=%p\n", brk2);
    // brk(brk_old+4);

    // brk_old = sbrk(0);
    // printf("brk=%p\n", brk_old);
    // brk_old = sbrk(0);
    // printf("brk=%p\n", brk_old);
    // brk_old = sbrk(4);
    // printf("brk=%p\n", brk_old);


    return 0;
}
