#define N 16
typedef int fix_matrix[N][N];

int fix_prod_ele(fix_matrix A, fix_matrix B, long i, long k)
{
    long j;
    int result = 0;
    for (j = 0; j < N; j++)
        result += A[i][j] * B[j][k];
    return result;
}

int var_ele(long n, int A[n][n], long i, long j)
{
    return A[i][j];
}



int var_ele2(long n, int A[n], long i, long j)
{
    return A[i];
}