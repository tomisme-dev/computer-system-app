#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
    int fd1 = open("c.txt", O_WRONLY|O_APPEND, 0);
    int fd2 = open("c.txt", O_WRONLY|O_APPEND, 0);

    printf("fd1=%d, fd2=%d\n", fd1, fd2);
    return 0;
}
