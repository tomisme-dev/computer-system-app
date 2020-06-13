#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

#define DEF_MODE S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH

int main(int argc, char const *argv[])
{
    int fp = open("./c.txt", O_RDWR|O_CREAT, DEF_MODE);

    // close(fp);
    

    while(1){}
    return 0;
}
