/* Apply Horner’s method */
double polyh(double a[], double x, int degree)
{
    long int i;
    double result = a[degree];
    for (i = degree - 1; i >= 0; i--)
        result = a[i] + x * result;
    return result;
}

double poly(double a[], double x, int degree)
{
    long int i;
    double result = a[0];
    double xpwr = x; /* Equals x^i at start of loop */
    for (i = 1; i <= degree; i++)
    {
        result += a[i] * xpwr;
        xpwr = x * xpwr;
    }
    return result;
}


int sum(int a[], int len) {
    int result = 0;
    for(int i = 0; i < len; i++) {
        result += a[i];
    }
    return result;
}