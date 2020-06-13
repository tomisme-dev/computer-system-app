#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
    char const * dd = argv[1];
    struct in_addr in;
    inet_aton(dd, &in);
    printf("%x\n", ntohl(in.s_addr));
    return 0;
}
