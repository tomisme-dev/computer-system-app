void minmax2(int a[], int b[], int n)
{
    int i;
    for (i = 0; i < n; i++)
    {
        int min = a[i] < b[i] ? a[i] : b[i];
        int max = a[i] < b[i] ? b[i] : a[i];
        a[i] = min;
        b[i] = max;
    }
}