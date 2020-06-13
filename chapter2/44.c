#include <stdio.h>

int main(int argc, char const *argv[])
{
    for (int i = -2147483648; i < 2147483647; i++)
    {
        if (i * i < 0)
        {
            printf("%x, %d\n", i, (i * i));
            break;
        }
    }

    int x = -2147483648;
    int y = 2147483647;

    int ux = x;
    int uy = y;

    printf("%d\n", (x * ~y + ux * uy == -x));
    printf("finished!!!\n");
    return 0;
}

// -2147437307 -2147479015
// 3604291966031203804