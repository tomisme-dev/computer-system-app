#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    setenv("size", "18", 1);

    char* args[4];
    char* envs[3];
    envs[0] = "name=tom";
    envs[1] = "age=16";
    envs[2] = NULL;

    char buf[10];
    sprintf(buf, "%d", getpid());
    args[0] = "abc";
    args[1] = buf;
    args[2] = getenv("size");
    args[3] = NULL;

    


    

    printf("8.4.5.2, before execve pid=%d", getpid());

    int rt = execve("helloworld", args, envs);
    printf("8.4.5.2, pid=%d, rt=%d\n", getpid(), rt);
    printf("error: %s\n", strerror(errno));
    return 0;
}
