#include <netdb.h>
#include <stdio.h>
#include <netinet/in.h>
#include <arpa/inet.h>

void print_char_2_arr(char** ptr) {
    char ** cp = ptr;
    while(*cp) {
        printf("%s\n", *cp);
        cp++;
    }
}

int main(int argc, char const *argv[])
{
    char * domain_name = "baidu.com";
    struct hostent *host = gethostbyname(domain_name);
    if(!host) 
    {
        printf("获取domain异常\n");
        return 1;
    }

    printf("h_length=%d\n", host->h_length);
    printf("h_name=%s\n", host->h_name);
    
    printf("h_aliases:\n");
    print_char_2_arr(host->h_aliases);

    printf("h_addr_list:\n");

    struct in_addr **in = (struct in_addr **)host->h_addr_list;
    //  = (struct in_addr **)host->h_addr_list;
    while(*in) {
        printf("in_addr=%s\n", inet_ntoa(**in));
        in++;
    }


    return 0;
}


