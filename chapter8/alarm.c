
#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

static int beeps = 0;

void handler(int sig)
{
    

    printf("BEEP\n");
    if (++beeps < 5)
    {
        // alarm(1); /* Next SIGALRM will be delivered in 1 second */
        printf("in handler...\n");
        sleep(10);
        printf("child after alarm...pid = %d\n", getpid());
    }
    else
    {
        printf("BOOM!\n");
        exit(0);
    }

    exit(0);
}

int main()
{
    signal(SIGALRM, handler); /* Install SIGALRM handler */
    // alarm(1);                 /* Next SIGALRM will be delivered in 1s */

    if(fork() == 0) {
        printf("child...\n");
        // 向父页面发一个alarm信号
        kill(getppid(), SIGALRM);
        exit(0);
    }

    printf("after alarm...pid = %d\n", getpid());
    while (1)
    {
        ; /* Signal handler returns control here each time */
        printf("in while...%d\n", beeps);
    }
    
    exit(0);
}