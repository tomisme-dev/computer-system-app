#include "../util/csapp.h"


void echo(int connfd) {
    printf("echo...connfd=%d\n", connfd);
}

void sigchld_handler(int sig)
{
    while (waitpid(-1, 0, WNOHANG) > 0)
        ;
    return;
}

int main(int argc, char **argv)
{
    int listenfd, connfd, port;
    socklen_t clientlen = sizeof(struct sockaddr_in);
    struct sockaddr_in clientaddr;

    if (argc != 2)
    {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(0);
    }
    port = atoi(argv[1]);

    signal(SIGCHLD, sigchld_handler);
    listenfd = open_listenfd(port);
    while (1)
    {
        connfd = accept(listenfd, (SA *)&clientaddr, &clientlen);
        if (fork() == 0)
        {
            close(listenfd); /* Child closes its listening socket */
            echo(connfd);    /* Child services client */
            close(connfd);   /* Child closes connection with client */
            exit(0);         /* Child exits */
        }
        close(connfd); /* Parent closes connected socket (important!) */
    }
}