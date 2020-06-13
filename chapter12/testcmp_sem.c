#include <stdio.h>
#include <pthread.h>
#include <sys/time.h>
#include <semaphore.h>

#define THREAD_CNT 8


int a = 0;
sem_t add_mutex;

long current_ms() {
    struct timeval cur_time;
    gettimeofday(&cur_time, NULL);
    return cur_time.tv_sec * 1000 + cur_time.tv_usec / 1000;
}

void * sum(void *arg) {
    // printf("sum...\n");
    for(int i = 0; i < 10000000; i++) {
        sem_wait(&add_mutex);
        a++;
        sem_post(&add_mutex);
    }
    // printf("sum=%d\n", a);
}

int main(int argc, char const *argv[])
{
    long start = current_ms();
    
    sem_init(&add_mutex, 0, 1);
    pthread_t tids[THREAD_CNT];
    for(int i = 0; i < THREAD_CNT; i++) {
        pthread_create(&tids[i], NULL, sum, NULL);
    }
    
    // 等待
    for(int i = 0; i < THREAD_CNT; i++) {
        pthread_join(tids[i], NULL);
    }

    printf("result=%d, 耗时:%ldms\n", a, (current_ms() - start));
    sem_destroy(&add_mutex);
    
    return 0;
}

