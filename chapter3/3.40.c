#include <stdio.h>
/* Implementation of library function gets() */
char *gets(char *s)
{
    // int c;
    // char *dest = s;
    // while ((c = getchar()) != '\n' && c != EOF)
    //     *dest++ = c;
    // if (c == EOF && dest == s)
    //     /* No characters read */
    //     return NULL;
    // *dest++ = '\0'; /* Terminate string */
    s[0] = 4;
    return s;
}

/* Read input line and write it back */
void echo()
{
    char buf[8]; /* Way too small! */
    gets(buf);
    buf[9] = 10;
    printf("%d", buf[9]);
    // puts(buf);
}

int main(int argc, char const *argv[])
{
    echo();
    return 0;
}
