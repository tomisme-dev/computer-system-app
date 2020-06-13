#include <stdio.h>
#include <pthread.h>
#include <sys/time.h>

#define THREAD_CNT 8

extern int xchange(int *ptr, int expect, int dest);

int a = 0;
void cmp_add(int* cnt, int adder);

long current_ms() {
    struct timeval cur_time;
    gettimeofday(&cur_time, NULL);
    return cur_time.tv_sec * 1000 + cur_time.tv_usec / 1000;
}

void * sum(void *arg) {
    for(int i = 0; i < 10000000; i++) {
        cmp_add(&a, 1);
    }
}

int main(int argc, char const *argv[])
{
    long start = current_ms();
    int result = xchange(&a, 13, 13);
    printf("result=%d\n", result);
    pthread_t tids[THREAD_CNT];
    for(int i = 0; i < THREAD_CNT; i++) {
        pthread_create(&tids[i], NULL, sum, NULL);
    }
    
    // 等待
    for(int i = 0; i < THREAD_CNT; i++) {
        pthread_join(tids[i], NULL);
    }

    printf("result=%d, 耗时:%ldms\n", a, (current_ms() - start));
    
    return 0;
}

void cmp_add(int* cnt, int adder) {
    int tmp = 0;
    do {
        tmp = *cnt;
    } while(xchange(cnt, tmp, tmp+adder) == 0);
}

