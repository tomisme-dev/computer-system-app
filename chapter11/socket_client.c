#include "../util/csapp.h"

#define MAXLINE 1024

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        fprintf(stderr, "usage: %s <host> <port>\n", argv[0]);
        exit(0);
    }

    char *host = argv[1];
    int port = atoi(argv[2]);

    // 向服务端发起建立连接， 请求
    int clientfd = open_clientfd(host, port);
    // 准备开始读取
    rio_t rio;
    char buf[MAXLINE];
    rio_readinitb(&rio, clientfd);

    while(fgets(buf, MAXLINE, stdin) != NULL) {
        printf("write get===>%s", buf);
        rio_writen(clientfd, buf, strlen(buf));
        printf("before...%s\n", buf);
        rio_readlineb(&rio, buf, MAXLINE);
        printf("read...%s\n", buf);
        // fputs(buf, stdout);
    }

    close(clientfd);
    return 0;
}
