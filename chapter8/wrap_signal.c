#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <wait.h>
#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

typedef void (*sighandler_t)(int);

sighandler_t Signal(int signum, sighandler_t handler)
{
    struct sigaction action, old_action;

    action.sa_handler = handler;
    sigemptyset(&action.sa_mask); /* Block sigs of type being handled */
    action.sa_flags = SA_RESTART; /* Restart syscalls if possible */

    if (sigaction(signum, &action, &old_action) < 0)
        printf("Signal error");
    printf("install...\n");
    return (old_action.sa_handler);
}

void handle(int sig)
{
    printf("in...handle..\n");
}

int main(int argc, char const *argv[])
{
    Signal(SIGUSR1, handle);
    // signal(SIGUSR1, handle);

    if (fork() == 0)
    {
        sleep(1);
        kill(getppid(), SIGUSR1);

        // printf("child1 before...pid=%d\n", getpid());
        // kill(getppid(), SIGINT);
        // printf("child1 after...pid=%d\n", getpid());
        exit(0);
    }

    printf("before pause....\n");

    while (1)
    {
        /* code */
    }

    return 0;
}

// int main()
// {
//     struct sigaction newact,oldact;

//     /* 设置信号忽略 */
//     newact.sa_handler = SIG_IGN; //这个地方也可以是函数
//     sigemptyset(&newact.sa_mask);
//     newact.sa_flags = 0;
//     int count = 0;
//     pid_t pid = 0;

//     sigaction(SIGINT,&newact,&oldact);//原来的备份到oldact里面

//     pid = fork();
//     if(pid == 0)
//     {
//         while(1)
//         {
//             printf("I'm child gaga.......\n");
//             sleep(1);
//         }
//         return 0;
//     }

//     while(1)
//     {
//         if(count++ > 3)
//         {
//             sigaction(SIGINT,&oldact,NULL);  //备份回来
//             printf("pid = %d\n",pid);
//             kill(pid,SIGKILL); //父进程发信号，来杀死子进程
//         }

//         printf("I am father .......... hahaha\n");
//         sleep(1);
//     }

//     return 0;
// }

