#include<stdio.h>
#include<stdlib.h>

#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char const *argv[])
{
    printf("before fork....\n");
    pid_t pid = fork();
    if(pid == 0) {
        sleep(10);
        printf("child1: %d\n", getpid());
        exit(0);
    }

    if(fork() == 0) {
        sleep(1);
        printf("child2: %d\n", getpid());
        exit(0);
    }

    printf("parent: %d\n", getpid());
    // 等代子进程结束
    int child_exit_status = 0;
    waitpid(-1, &child_exit_status, 0);

    printf("parent finished...child status = %d, WIFEXITED=%d, WEXITSTATUS=%d， WIFSTOPPED=%d\n", \
        child_exit_status, WIFEXITED(child_exit_status), WEXITSTATUS(child_exit_status), WIFSTOPPED(child_exit_status));
    return 0;
}
