int count = 0;
int f() {
    return count++;
}


int func1()
{
    return f() + f() + f() + f();
}

int func2()
{
    return 4 * f();
}