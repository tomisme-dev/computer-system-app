#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

static int beeps = 0;

void handler(int sig)
{
    printf("receive signal: %d", sig);
    exit(0);
}

int main()
{
    signal(SIGCONT, handler); /* Install SIGALRM handler */

    if(fork() == 0) {
        printf("child...\n");
        sleep(1);
        kill(getppid(), SIGSTOP);
        sleep(5);
        kill(getppid(), SIGCONT);
        exit(0);
    }

    printf("pid = %d\n", getpid());
    while (1)
    {
        // printf("while...\n");
    }
    
    return 0;
}