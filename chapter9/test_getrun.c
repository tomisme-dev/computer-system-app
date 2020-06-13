#include <sys/time.h>
#include <sys/resource.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
    struct rusage info;
    int result = getrusage(RUSAGE_SELF, &info);
    printf("result=%d\n", result);
    printf("ru_maxrss=%ld\n", info.ru_maxrss);
    printf("ru_minflt=%ld\n", info.ru_minflt);
    printf("ru_majflt=%ld\n", info.ru_majflt);
	while(1);
    return 0;
}
