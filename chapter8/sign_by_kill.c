#include <sys/types.h>
#include <signal.h>
#include <unistd.h>
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char const *argv[])
{
    pid_t pid;
    if((pid = fork()) == 0) {
        printf("child1, cur_pid=%d, group_pid=%d, ppid=%d\n", getpid(), getpgrp(), getppid());
        pause();
        printf("after pause...\n");
        exit(0);


    }

    sleep(1);
    kill(pid, SIGCONT);
    sleep(1);
    printf("parent, cur_pid=%d, group_pid=%d, ppid=%d\n", getpid(), getpgrp(), getppid());
    return 0;
}
