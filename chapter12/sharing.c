#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>

#define N 2
void *thread(void *vargp);
void f1(void);

char **ptr; /* Global variable */
sem_t mutex;

int main()
{
    int i;
    pthread_t tid;
    char *msgs[N] = {"Hello from foo","Hello from bar"};
    sem_init(&mutex, 0, 1);

    ptr = msgs;
    for (i = 0; i < N; i++) {
        int *ptr_i; 
        ptr_i = malloc(sizeof(int));
        *ptr_i = i;
        pthread_create(&tid, NULL, thread, ptr_i);
    }
        
    // pthread_exit(NULL);
    while (1)
    {
        /* code */
    }
    
}

void f1() {
    char *msg = "abc";
    printf("msg: %d\n", msg[0]);
}


void *thread(void *vargp)
{
    // int myid = *((int *)vargp);
    volatile static int cnt = 0;
    // printf("[%d]: %s (cnt=%d)\n", myid, ptr[myid], ++cnt);
    // f1();

    for(int i = 0; i < 1000000; i++) {
        sem_wait(&mutex);
        cnt++;
        sem_post(&mutex);
    }

    printf("thread...cnt=%d\n", cnt);

    return NULL;
}