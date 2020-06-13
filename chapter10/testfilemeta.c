#include <unistd.h>
#include <sys/stat.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
    struct stat st;

    stat(argv[1], &st);

// 判断文件类型
    if(S_ISREG(st.st_mode)) {
        printf("是个文件\n");
    } else if(S_ISDIR(st.st_mode)) {
        printf("是个文件夹\n");
    }

// 判断权限
    if(st.st_mode & S_IRUSR) {
        printf("当前用户可读\n");
    } else {
        printf("当前用户不可读\n");
    }

    return 0;
}