#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
    struct in_addr ip;
    ip.s_addr = htonl(0x7f000001);
    char * dd = inet_ntoa(ip);
    printf("dot-decimal: %s\n", dd);
    return 0;
}
