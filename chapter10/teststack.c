#include <stdio.h>

char f1() {
    char a[8];
    a[0] = 0;
    a[2] = 2;
    a[6] = 7;
    a[7] = 7;

    return a[0];
}

int f2(int x) {
   return x * 2;
    // int y = 4;
    // return &y;
}

int main(int argc, char const *argv[])
{
    // char *arr = f1();

    // f2(3);

    // for(int i = 0; i < 8; i++) {
    //     printf("%d\n", arr[i]);
    // }
    return 0;
}
