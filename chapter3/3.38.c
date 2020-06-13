#define M 3
#define N 5

long P[M][N];
long Q[N][M];
long sum_element(long i, long j)
{
    return P[i][j] + Q[j][i];
}