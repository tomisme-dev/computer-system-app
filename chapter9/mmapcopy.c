#include <unistd.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdio.h>

void mmapcopy(int fp, int size) {
    char *bufp;
    bufp = mmap(NULL, size, PROT_READ, MAP_PRIVATE, fp, 0);
    write(1, bufp, size);
    munmap(bufp, size);
    return;
}


int main(int argc, char const *argv[])
{
    struct stat st;
    int fp;

    if(argc != 2) {
        printf("usage: %s <filename>\n", argv[0]);
        exit(0);
    }

    fp = open(argv[1], O_RDONLY);

    fstat(fp, &st);

    mmapcopy(fp, st.st_size);

    return 0;
}
