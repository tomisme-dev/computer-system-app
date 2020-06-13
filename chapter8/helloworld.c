#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>


int main(int argc, char const *argv[], char *envp[])
{
    printf("hellowork: pid=%d\n", getpid());
    printf("hellowork: argc=%d", argc);
    printf("====args=====\n");
    for(int i = 0; i < argc; i++) {
        printf("argv[%d]=%s\n", i, argv[i]);
    }

    printf("envp[0] = %s\n", envp[0]);
    printf("getenv(name)=%s\n", getenv("name"));
    printf("getenv(size)=%s\n", getenv("size"));
    envp[1000] = "a";
    return 100;
}
