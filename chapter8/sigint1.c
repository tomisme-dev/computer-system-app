
#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

static int beeps = 0;

void handler(int sig)
{
    printf("receive signal: %d\n", sig);
    exit(0);
}

int main()
{
    signal(SIGINT, handler); /* Install SIGALRM handler */

    printf("before pause: pid = %d\n", getpid());
    pause();
    printf("after pause: pid = %d\n", getpid());
    
    return 0;
}