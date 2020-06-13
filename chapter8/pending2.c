#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>


void handler(int sig)
{
    printf("interrupt...pid=%d\n", getpid());
    sleep(5);
    printf("after interrupt...pid=%d\n", getpid());
}

int main(int argc, char const *argv[])
{
    printf("start....\n");

    signal(SIGINT, handler);

    if(fork() == 0) {
        printf("child1 before...pid=%d\n", getpid());
        kill(getppid(), SIGINT);
        printf("child1 after...pid=%d\n", getpid());
        exit(0);
    }

    if(fork() == 0) {
        printf("child2 before...pid=%d\n", getpid());
        kill(getppid(), SIGINT);
        printf("child2 after...pid=%d\n", getpid());
        exit(0);
    }

    if(fork() == 0) {
        printf("child3 before...pid=%d\n", getpid());
        kill(getppid(), SIGINT);
        printf("child3 after...pid=%d\n", getpid());
        exit(0);
    }

    
    return 0;
}
