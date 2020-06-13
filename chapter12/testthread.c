#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void *thread(void *vargp);

struct p_arg
{
    char *name;
    int age;
};


int main()
{
    pthread_t tid;
    struct p_arg arg1;
    arg1.name = "tom";
    arg1.age = 18;

    pthread_create(&tid, NULL, thread, &arg1);
    printf("child thread...tid=%ld\n", tid);
    pthread_detach(tid);
    sleep(1);
    // printf("parent thread...tid=%ld\n", pthread_self());
    pthread_cancel(tid);
    // pthread_join(tid, NULL);
    printf("finish...\n");

    while (1)
    {
        /* code */
    }
    
    exit(0);
}

void *thread(void *vargp) /* Thread routine */
{
    struct p_arg * arg = (struct p_arg *)vargp;
    printf("Hello, world!...%s...%d...\n", arg->name, arg->age);
    // pthread_exit(NULL);
    // exit(0);
    sleep(2);
    printf("my thread...tid=%ld\n", pthread_self());
    // printf("cancle_result=%d\n", cancle_result);
    return NULL;
}