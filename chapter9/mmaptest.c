#include <unistd.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdio.h>


int main(int argc, char const *argv[])
{
    void *ptr = mmap(NULL, 4 * 1024, PROT_WRITE, MAP_ANON | MAP_PRIVATE, 0, 0);
    if(ptr == MAP_FAILED) {
        printf("mapped failed...\n");
        exit(0);
    }

    int *arr = ptr;
    for(int i = 0; i < 20; i++) {
        arr[i] = i + 1;
    }


    char *c = ptr;
    for(int i = 0; i < 100; i++) {
        // printf("%d: %d\n", i, c[i]);
    }

    printf("ptr=%p\n", ptr);
    munmap(ptr, 4 * 1024);
    return 0;
}
