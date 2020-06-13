#include <stdio.h>
#include <signal.h>
#include <setjmp.h>
#include <unistd.h>


sigjmp_buf buf;


void handler(int sig) {
    printf("in hanlder..\n");
    siglongjmp(buf, 12);
}




int main(int argc, char const *argv[])
{
    // 注册handler
    signal(SIGINT, handler);

    int retval = sigsetjmp(buf, 1);
    if(retval == 0) {
        printf("first in....\n");
    } else {
        printf("after retval...val=%d\n", retval);
    }

    while (1)
    {
        sleep(1);
        printf("while....\n");
    }
    

    return 0;
}
