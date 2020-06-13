#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

typedef double data_t;

typedef struct
{
    long int len;
    data_t *data;
} vec_rec, *vec_ptr;

int a = 6;

/* Create vector of specified length */
vec_ptr new_vec(long int len)
{
    /* Allocate header structure */
    vec_ptr result = (vec_ptr)malloc(sizeof(vec_rec));
    if (!result)
        return NULL; /* Couldn’t allocate storage */
    result->len = len;
    /* Allocate array */
    if (len > 0)
    {
        data_t *data = (data_t *)calloc(len, sizeof(data_t));
        if (!data)
        {
            free((void *)result);
            return NULL; /* Couldn’t allocate storage */
        }
        result->data = data;
    }
    else
        result->data = NULL;
    return result;
}

/*
* Retrieve vector element and store at dest.
* Return 0 (out of bounds) or 1 (successful)
*/
int get_vec_element(vec_ptr v, long int index, data_t *dest)
{
    if (index < 0 || index >= v->len)
        return 0;
    *dest = v->data[index];
    return 1;
}

/* Return length of vector */
long int vec_length(vec_ptr v)
{
    return v->len;
}


#define IDENT 1
#define OP *

/* Implementation with maximum use of data abstraction */
void combine1(vec_ptr v, data_t *dest)
{
    long int i;
    *dest = IDENT;
    for (i = 0; i < vec_length(v); i++)
    {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
}


void combine2(vec_ptr v, data_t *dest)
{
    long int i;
    *dest = IDENT;
    for (i = 0; i < vec_length(v); i++)
    {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
}


void combine3(vec_ptr v, data_t *dest)
{
    long int i;
    *dest = IDENT;
    for (i = 0; i < vec_length(v); i++)
    {
        // get_vec_element(v, i, &val);
        *dest = *dest OP v->data[i];
        // printf("*dest=%f\n", *dest);
    }
}

#include <sys/time.h>
#include <unistd.h>

int main(int argc, char const *argv[])
{
    vec_ptr ptr = new_vec(40);
    for(int i = 0, max = ptr->len; i < max; i++) {
        ptr->data[i] = i+1.0;
    }
    data_t result = IDENT;

    struct timeval time;
    /* 获取时间，理论到us */
    gettimeofday(&time, NULL);
    long start = time.tv_sec * 1000 * 1000 + time.tv_usec;
    combine3(ptr, &result);
    // 重新计算时间
    gettimeofday(&time, NULL);
    long end = time.tv_sec * 1000 * 1000 + time.tv_usec;
    printf("result=%f\n", result);

    printf("耗时: %d\n", (end-start));

 

    return 0;
}

