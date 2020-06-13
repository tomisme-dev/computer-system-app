#include <semaphore.h>

typedef struct sbuf
{
    // buffer array
    int *buf;
    // array size
    int n;
    // buf[(front+1)%n] is first item
    int front;
    // buf[rear%n] is last item
    int rear;
    // protected access to buf
    sem_t mutex;
    // counts available slots
    sem_t slot;
    // counts available items
    sem_t items;
} sbuf_t;

void sbuf_init(sbuf_t *sp, int n);
void sbuf_deinit(sbuf_t *sp);
void subf_insert(sbuf_t *sp, int item);
int subf_remove(sbuf_t *sp);