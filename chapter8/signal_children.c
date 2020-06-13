#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <wait.h>

void handler(int sig)
{
    printf("interrupt...pid=%d\n", getpid());
    sleep(5);
    printf("after interrupt...pid=%d\n", getpid());
}

int main(int argc, char const *argv[])
{
    printf("start....\n");

    // signal(SIGCHLD, handler);

    for (int i = 0; i < 3; i++)
    {
        if (fork() == 0)
        {
            printf("child before...pid=%d\n", getpid());
            // kill(getppid(), SIGINT);
            printf("child after...pid=%d\n", getpid());
            
            exit(0);
        }
    }

    sleep(2);
    pid_t pid;
    while ((pid = waitpid(0, NULL, 0)) > 0)
    {
        printf("wait: pid=%d\n", pid);
    }
    

    return 0;
}
