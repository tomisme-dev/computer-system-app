#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#define DEF_MODE S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH

int main(int argc, char const *argv[])
{
    int fd = open("./c.txt", O_RDWR|O_CREAT, DEF_MODE);

    int size = 1024;
    char buf[size];
    // buf[size-2] = '\0';

    int read_size = 0;
    while(read_size = read(fd, buf, size-1)) {
        if(read_size == -1) {
            printf("read error...\n");
            return 1;
        }

        buf[read_size] = '\0';
        printf("%s", buf);
    }

    close(fd);

    return 0;
}
