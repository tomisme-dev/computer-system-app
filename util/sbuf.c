#include <semaphore.h>
#include "sbuf.h"
#include "csapp.h"


void sbuf_init(sbuf_t *sp, int n) {
    sp->n = n;
    sp->buf = calloc(n, sizeof(int));
    sp->front = sp->rear = 0;
    sem_init(&sp->mutex, 0, 1);
    sem_init(&sp->slot, 0, n);
    sem_init(&sp->items, 0, 0);
}

void sbuf_deinit(sbuf_t *sp) {
    free(sp);
}

void subf_insert(sbuf_t *sp, int item) {
    // 判断slot是否满了
    sem_wait(&sp->slot);
    // 没满的情况下，获取互斥锁
    sem_wait(&sp->mutex);
    // 插入
    sp->rear = (sp->rear+1) % sp->n;
    sp->buf[sp->rear] = item;
    // 释放互斥锁
    sem_post(&sp->mutex);
    // 增加item锁
    sem_post(&sp->items);
}

int subf_remove(sbuf_t *sp) {
    // 判断item是否有数据
    sem_wait(&sp->items);
    // 拿到互斥锁
    sem_wait(&sp->mutex);
    // 执行删除
    int result = sp->buf[(sp->front+1)%sp->n];
    sp->front++;
    // 释放互斥锁
    sem_post(&sp->mutex);
    // 增加空的slot
    sem_post(&sp->slot);
    return result;
}