#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>

int main()
{
    int fd;
    char c;

    fd = open("c.txt", O_RDONLY, 0);
    if (fork() == 0)
    {
        read(fd, &c, 1);
        exit(0);
    }
    wait(NULL);
    read(fd, &c, 1);
    printf("c = %c\n", c);
    exit(0);
}
