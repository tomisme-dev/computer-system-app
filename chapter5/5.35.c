#include <string.h>
#include <stdio.h>

void lower2(char *s)
{
    int i;
    int len = strlen(s);
    int delta = 'a' - 'A';

    for (i = 0; i < len; i++) {
        int alpha = s[i];
        int cmp = (alpha >= 'A') & (alpha <= 'Z');
        s[i] = alpha + (cmp ? delta: 0);
    }
}


int main(int argc, char const *argv[])
{
    char name[] = "Hello, WoRlD!!\n";
    lower2(name);
    printf("name===>%s", name);
    return 0;
}
