struct str2
{
    char x;
    short y;
    char z;
};

struct S1
{
    char i;
    struct str2 s2;
    long j;
    char c;
};

void set_s1(struct S1 *sp)
{
    sp->i = 2;
    sp->c = 3;
    sp->j = 4;
    sp->s2.x = 9;
    sp->s2.y = 10;
    sp->s2.z = 11;
}

struct S2
{
    int i;
    int j;
    char c;
};


void set_s2(long n, struct S2 d[n])
{
    // struct S2 d[4];
    d[0].j = 2;
    d[1].j = 3;
}