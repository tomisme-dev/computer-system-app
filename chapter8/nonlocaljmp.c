
#include <stdio.h>
#include <setjmp.h>

static jmp_buf buf;

void f()
{
    printf("in...f()\n");
    longjmp(buf, 1);
    printf("after longjmp...\n");
}

int main(int argc, char const *argv[])
{
    int rc = setjmp(buf);

    if (rc == 0)
    {
        printf("first...in...\n");
        f();
    } else if(rc == 1) {
        printf("error1....\n");
    } else
    {
        printf("other error...\n");
    }
    
    return 0;
}
