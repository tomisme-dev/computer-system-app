#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

void handler(int sig)
{
    printf("interrupt...");
}

int main(int argc, char const *argv[])
{
    printf("start....\n");

    signal(SIGINT, handler);

    if (argc == 2)
    {
        int sleep_seconds = atoi(argv[1]);
        printf("%d\n", sleep_seconds);
        int leave_seconds = sleep(sleep_seconds);
        printf("Slept for %d of %d secs..\n", (sleep_seconds - leave_seconds), sleep_seconds);
    }

    return 0;
}
