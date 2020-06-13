#include "../util/csapp.h"

#define MAXLINE 1024

void echo(int fd)
{
    size_t n;
    char buf[MAXLINE];
    rio_t rio;

    rio_readinitb(&rio, fd);
    while ((n = rio_readlineb(&rio, buf, MAXLINE)) != 0)
    {
        printf("server received %ld bytes. fd=%d\n", n, fd);
        char *msg = "reveived!\n";
        size_t si = rio_writen(fd, msg, strlen(msg));
        printf("finish write...size=%lu\n");
    }
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(0);
    }

    int port = atoi(argv[1]);

    // 创建listen descriptor
    
    int listenfd = open_listenfd(port);

    // accept
    struct sockaddr_in clientaddr;
    int clientlen;

    while (1)
    {
        int connfd = accept(listenfd, (struct sockaddr *)&clientaddr, &clientlen);
        char *clientip = inet_ntoa(clientaddr.sin_addr);
        unsigned short port = ntohs(clientaddr.sin_port);
        printf("client ip: %s, port: %d,\n", clientip, port);

        echo(connfd);
        printf("before close conn...\n");
        close(connfd);
        printf("close conn...\n");
    }

    close(listenfd);
    return 0;
}
