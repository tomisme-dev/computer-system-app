#include "../util/csapp.h"
#include <pthread.h>

void echo(int connfd);
void *thread(void *vargp);

int main(int argc, char **argv)
{
    int listenfd, *connfdp, port;
    socklen_t clientlen = sizeof(struct sockaddr_in);
    struct sockaddr_in clientaddr;
    pthread_t tid;

    if (argc != 2)
    {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(0);
    }
    port = atoi(argv[1]);

    listenfd = open_listenfd(port);
    while (1)
    {
        connfdp = malloc(sizeof(int));
        *connfdp = accept(listenfd, (SA *)&clientaddr, &clientlen);
        pthread_create(&tid, NULL, thread, connfdp);
    }
}

/* Thread routine */
void *thread(void *vargp)
{
    int connfd = *((int *)vargp);
    pthread_detach(pthread_self());
    free(vargp);
    echo(connfd);
    close(connfd);
    return NULL;
}

void echo(int connfd)
{
    printf("echo...connfid: %d\n", connfd);
}
