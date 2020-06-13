int main(int argc, char const *argv[])
{

    return 0;
}

void twiddle1(int *xp, int *yp)
{
    *xp += *yp;
    *xp += *yp;
}

void twiddle2(int *xp, int *yp)
{
    *xp += 2 * *yp;
}