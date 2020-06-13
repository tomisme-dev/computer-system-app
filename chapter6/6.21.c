int main(int argc, char const *argv[])
{
    int n = 100;
    int a[n][n];
    int b[n][n];
    int c[n][n];

    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            int add = a[i][j];

            for(int k = 0; k < n; k++) {
                c[j][k] += add * b[j][k];
            }
        }
    }

    return 0;
}
