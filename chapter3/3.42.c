struct ACE
{
    short v;
    struct ACE *p;
};
short test(struct ACE *ptr)
{
    short result = 1;
    while (ptr != 0)
    {
        result *= ptr->v;
        ptr = ptr->p;
    }
    return result;
}