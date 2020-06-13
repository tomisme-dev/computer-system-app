#include <semaphore.h>

sem_t read_mutex, w;
int read_cnt = 0;
void read() {
    // 增加read_cnt的数量
    sem_wait(&read_mutex);
    read_cnt++;
    if(read_cnt == 1) {
        // 第一个读进入时，获取w锁
        sem_wait(&w);
    }
    sem_post(&read_mutex);

    // 执行read

    // 减少read_cnt的数量
    sem_wait(&read_mutex);
    read_cnt--;
    if(read_cnt == 0) {
        // 最后一个read结束，释放w锁
        sem_post(&w);
    }
    sem_post(&read_mutex);
}

void write() {
    sem_wait(&w);
    // do write

    sem_post(&w);
}