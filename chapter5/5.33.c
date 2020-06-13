/* Write to dest, read from src */
void write_read(int *src, int *dest, int n)
{
    int cnt = n;
    int val = 0;
    while (cnt--)
    {
        *dest = val;
        val = (*src) + 1;
    }
}