#include "../util/csapp.h"
#include "../util/sbuf.h"

// 池子
sbuf_t sbuf;
#define POOL_SIZE 10
void *run(void * arg);

int main(int argc, char const *argv[])
{
    
    if (argc != 2)
    {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(0);
    }

    int port = atoi(argv[1]);
    pthread_t tid;
    // 初始化池子, 
    sbuf_init(&sbuf, POOL_SIZE);
    //创建对应的线程池
    for(int i = 0; i < POOL_SIZE; i++) {
        pthread_create(&tid, NULL, run, NULL);
    }

    // 主线程接受请求, 并将请求放入池中
    int listenfd = open_listenfd(port);
    socklen_t clientlen = sizeof(struct sockaddr_in);
    struct sockaddr_in clientaddr;
    while(1) {
        int cnnfd = accept(listenfd, (SA *)&clientaddr, &clientlen);
        // 将连接加入到任务池
        subf_insert(&sbuf, cnnfd);
    }

    return 0;
}

void *run(void *arg) {
    pthread_detach(pthread_self());
    while(1) {
        // 死循环，接受任务
        int cnnfd = subf_remove(&sbuf);
        printf("thread-%ld-接受到连接：connfd=%d\n", pthread_self(), cnnfd);
        char * msg = "i have receive.\n";
        // write(cnnfd, msg, strlen(msg));
        char buf[1024];
        read(cnnfd, buf, 1024);
        printf("接收到消息：%s\n", buf);
        // 发送消息
        write(cnnfd, msg, strlen(msg));
        // 完成任务后，关闭连接
        close(cnnfd);
    }
}