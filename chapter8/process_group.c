#include<unistd.h>
#include<stdio.h>
#include<sys/types.h>
#include<stdlib.h>

int main(int argc, char const *argv[])
{
    if(fork() == 0) {
        printf("child1, cur_pid=%d, group_pid=%d, ppid=%d\n", getpid(), getpgrp(), getppid());
        
        if(fork() == 0) {
            setpgid(0, 0);
            printf("child2, cur_pid=%d, group_pid=%d, ppid=%d\n", getpid(), getpgrp(), getppid());
            sleep(60);
            exit(0);
        }
        
        sleep(60);
        exit(0);


    }

    printf("parent, cur_pid=%d, group_pid=%d, ppid=%d\n", getpid(), getpgrp(), getppid());
    sleep(120);
    return 0;
}
