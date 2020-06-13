#include "../util/csapp.h"
#include <stdio.h>

int main(int argc, char const *argv[])
{
    // int client_fd = open_clientfd("localhost", 8080);
    int server_fd = open_listenfd(8888);
    printf("%d\n", server_fd);
    return 0;
}
