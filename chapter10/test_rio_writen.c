#include "../util/csapp.h"
#include <fcntl.h>


int main(int argc, char const *argv[])
{
    int fd1 = open("c.txt", O_RDWR, 0);
    int size = rio_writen(fd1, "hello", 3);
    if(size < 0) {
        printf("write error...\n");
    } else {
        printf("finish...\n");
    }
    close(fd1);
    return 0;
}
