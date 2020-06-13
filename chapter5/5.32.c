/* Set elements of array to 0 */
void clear_array(int *dest, int n)
{
    int i;
    for (i = 0; i < n; i++)
        dest[i] = 0;
}
/* Set elements of array to 0, Unrolled X4 */
void clear_array_4(int *dest, int n)
{
    int i;
    int limit = n - 3;
    for (i = 0; i < limit; i += 4)
    {
        dest[i] = 0;
        dest[i + 1] = 0;
        dest[i + 2] = 0;
        dest[i + 3] = 0;
    }
    for (; i < limit; i++)
        dest[i] = 0;
}