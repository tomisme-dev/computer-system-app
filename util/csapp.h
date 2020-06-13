#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define __USE_GNU
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <pthread.h>



#define SA struct sockaddr
#define RIO_BUFSIZE 8192
#define MAXLINE 2048

typedef struct
{
    int rio_fd;                /* Descriptor for this internal buf */
    int rio_cnt;               /* Unread bytes in internal buf */
    char *rio_bufptr;          /* Next unread byte in internal buf */
    char rio_buf[RIO_BUFSIZE]; /* Internal buffer */
} rio_t;

ssize_t rio_readn(int fd, void *usrbuf, size_t n);
ssize_t rio_writen(int fd, void *usrbuf, size_t n);

void rio_readinitb(rio_t *rp, int fd);
ssize_t rio_readlineb(rio_t *rp, void *usrbuf, size_t maxlen);
ssize_t rio_readnb(rio_t *rp, void *usrbuf, size_t n);

/**
 * @return: descriptor if OK, −1 on Unix error, −2 on DNS error
*/
int open_clientfd(char *hostname, int port);

/**
 * @return: descriptor if OK, −1 on Unix error
*/
int open_listenfd(int port);
