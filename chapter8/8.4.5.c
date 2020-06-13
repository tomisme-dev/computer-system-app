#include <stdlib.h>
#include<sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

int main(int argc, char const *argv[])
{
    if(fork() == 0) {
        printf("child:\n");
        exit(101);
    }

    pid_t pid = waitpid(-1, NULL, 0);
    printf("parent1: %d\n", pid);

    pid = waitpid(-1, NULL, 0);
    printf("parent2: %d\n", pid);
    printf("errorNo=%d, errorMsg=%s", errno, strerror(errno));
    return 0;
}
