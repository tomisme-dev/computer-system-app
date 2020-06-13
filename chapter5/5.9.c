void merge(int src1[], int src2[], int dest[], int n)
{
    int i1 = 0;
    int i2 = 0;
    int id = 0;
    while (i1 < n && i2 < n)
    {
        if (src1[i1] < src2[i2])
            dest[id++] = src1[i1++];
        else
            dest[id++] = src2[i2++];
    }
    while (i1 < n)
        dest[id++] = src1[i1++];
    while (i2 < n)
        dest[id++] = src2[i2++];
}

void merge2(int src1[], int src2[], int dest[], int n)
{
    int i1 = 0;
    int i2 = 0;
    int id = 0;
    while (i1 < n && i2 < n)
    {
        int cmp = src1[i1] < src2[i2];
        int min_val = cmp ? src1[i1] : src2[i2];
        int i1_delta = cmp;
        i1 += i1_delta;
        i2 += (1-i1_delta);
        dest[id++] = min_val;
    }
    while (i1 < n)
        dest[id++] = src1[i1++];
    while (i2 < n)
        dest[id++] = src2[i2++];
}