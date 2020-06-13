#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include "csapp.h"
#include <string.h>

#include <stdio.h>

/**
 * 封装一个健壮型读
 * 
*/
ssize_t rio_readn(int fd, void *usrbuf, size_t n)
{
    size_t nleft = n;
    ssize_t nread = 0;
    char *buf = usrbuf;

    while (nleft > 0)
    {
        if (nread = read(fd, buf, nleft) < 0)
        {
            // 读取过程中发生异常
            if (errno == EINTR)
            {
                // 读取过程被打断
                nread = 0;
            }
            else
            {
                return -1;
            }
        }
        else if (nread == 0)
        {
            // 读完了, EOF
            break;
        }

        nleft -= nread;
        buf += nread;
    }

    return n - nleft;
}

/**
 * 封装一个健壮型写, n个字节必须全部写完
 * 
*/
ssize_t rio_writen(int fd, void *usrbuf, size_t n)
{

    size_t nleft = n;
    ssize_t nwrite = 0;
    char *buf = usrbuf;

    while (nleft > 0)
    {
        if ((nwrite = write(fd, buf, nleft)) < 0)
        {
            // 发生错误
            if (errno == EINTR)
            {
                // 被打断
                nwrite = 0;
            }
            else
            {
                return -1;
            }
        }

        nleft -= nwrite;
        buf += nwrite;
        printf("nleft=%d\n", nleft);
    }

    return n;
}

void rio_readinitb(rio_t *rp, int fd)
{
    rp->rio_fd = fd;
    rp->rio_cnt = 0;
    rp->rio_bufptr = rp->rio_buf;
}

/**
 * 将指定大小数据读取到rp中
 * 
*/
static ssize_t rio_read(rio_t *rp, char *usrbuf, size_t n)
{
    // 如果缓存为空， 先将缓存填满
    while (rp->rio_cnt <= 0)
    {
        rp->rio_cnt = read(rp->rio_fd, rp->rio_buf, sizeof(rp->rio_buf));
        if (rp->rio_buf < 0)
        {
            if (errno != EINTR)
            {
                return -1; /* Interrupted by sig handler return */
            }
        }
        else if (rp->rio_buf == 0)
        {
            // EOF
            return 0;
        }
        else
        {
            // 读取到了
            rp->rio_bufptr = rp->rio_buf; /* Reset buffer ptr */
        }
    }

    // 将n个数据读取到usrbuf中
    int cnt = n < rp->rio_cnt ? n : rp->rio_cnt;
    memcpy(usrbuf, rp->rio_bufptr, cnt);

    // 移动指针
    rp->rio_cnt -= cnt;
    rp->rio_bufptr += cnt;

    return cnt;
}

ssize_t rio_readlineb(rio_t *rp, void *usrbuf, size_t maxlen)
{
    int n, rc;
    char c, *buf = usrbuf;
    for (n = 1; n < maxlen; n++)
    {
        if ((rc = rio_read(rp, &c, 1)) == 1)
        {
            // 读取到了
            *buf = c;
            buf++;
            if (c == '\n')
            {
                break;
            }
        }
        else if (rc == 0)
        {
            if (n == 1)
            {
                return 0; //EOF no data was readed
            }
            else
            {
                break; // EOF
            }
        }
        else
        {
            return -1; // ERROR
        }
    }

    // 字符串最后追加一个0
    *buf = 0;
    return n;
}

ssize_t rio_readnb(rio_t *rp, void *usrbuf, size_t n)
{
    size_t nleft = n;
    ssize_t nread;
    char *bufp = usrbuf;

    while (nleft > 0)
    {
        if ((nread = rio_read(rp, bufp, nleft)) < 0)
        {
            if (errno == EINTR) /* Interrupted by sig handler return */
                nread = 0;      /* Call read() again */
            else
                return -1; /* errno set by read() */
        }
        else if (nread == 0)
            break; /* EOF */
        nleft -= nread;
        bufp += nread;
    }
    return (n - nleft); /* Return >= 0 */
}