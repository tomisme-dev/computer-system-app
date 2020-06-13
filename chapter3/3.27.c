#include <stdio.h>

void show_fibo(int n)
{
    int first = 1;
    int second = 1;
    int next;
    while (n > 2)
    {
        next = first + second;
        first = second;
        second = next;
        // printf("%d, ", next);
        n--;
    }

    printf("\n");
}

int sum()
{
    long sum = 0;
    long i;
    for (i = 0; i < 10; i++)
    {
        if (i & 1)
            continue;
        sum += i;
    }
    return sum;
}

int main(int argc, char const *argv[])
{
    printf("sum=%d\n", sum());
    return 0;
}
