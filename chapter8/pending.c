
#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

static int beeps = 0;

void handler(int sig)
{
    printf("child after alarm...pid = %d\n", getpid());
}

int main()
{
    signal(SIGALRM, handler); /* Install SIGALRM handler */

    alarm(1); /* Next SIGALRM will be delivered in 1s */
    alarm(1);

    printf("after alarm...pid = %d\n", getpid());
    while (1)
    {
        ; /* Signal handler returns control here each time */
        // printf("in while...%d\n", beeps);
    }

    exit(0);
}