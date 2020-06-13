#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

pid_t getpid(void);
pid_t getppid(void);

int main(int argc, char const *argv[])
{
    printf("getpid: %d\n", getpid());
    printf("getppid: %d\n", getppid());
    return 0;
}
