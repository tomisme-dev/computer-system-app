#include<stdio.h>
#include<stdlib.h>

#include <sys/types.h>
#include <unistd.h>

int main(int argc, char const *argv[])
{
    printf("before fork....\n");
    pid_t pid = fork();
    if(pid == 0) {
        sleep(30);
        printf("child: %d\n", getpid());
        exit(0);
    }

    printf("parent: %d\n", getpid());
    sleep(10);
    printf("parent finished...\n");
    return 0;
}
