#include <sys/types.h>
#include <sys/wait.h>

#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <stdlib.h>


void sigchld_handler(int sig)
{
    pid_t pid;
    // 通过waitpid函数收割已经运行结束的僵尸子进程
    while ((pid = waitpid(-1, 0, WNOHANG))  > 0) {
        printf("in...while...pid=%d...\n", pid);
    }
    return;
}

int main(int argc, char const *argv[])
{
    pid_t child_pid = 0;

    signal(SIGCHLD, sigchld_handler);
    for (int i = 0; i < 5; i++)
    {
        if ((child_pid = fork()) == 0)
        {
            // 子进程
            printf("child process: pid=%d\n", getpid());
            exit(0);
        }
    }

    while (1)
    {
    }

    return 0;
}
