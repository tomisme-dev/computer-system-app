#include <stdio.h>
struct rec
{
    int i;
    int j;
    int a[2];
    int *p;
};

struct rect
{
    long llx;             /* X coordinate of lower-left corner */
    long lly;             /* Y coordinate of lower-left corner */
    unsigned long width;  /* Width (in pixels) */
    unsigned long height; /* Height (in pixels) */
    unsigned color;       /* Coding of color */
};

long f(struct rect r)
{
    r.height = r.height + 88;
    return r.llx;
}

long f_pointer(struct rect *r)
{
    (*r).height = (*r).height + 88;
    return r->llx;
}

struct test
{
    short *p;
    struct
    {
        short x;
        short y;
    } s;
    struct test *next;
};

void st_init(struct test *st)
{
    st->s.y = st->s.x;
    st->p = &(st->s.y);
    st->next = st;
}

int main(int argc, char const *argv[])
{
    struct rect r;
    r.height = 400;
    r.width = 300;
    r.llx = 100;
    // r.lly = 200;
    r.color = 500;
    // printf("before: %ld\n", r.height);
    long result = f_pointer(&r);
    printf("after: %ld, %ld\n", r.height, result);
    return 0;
}
