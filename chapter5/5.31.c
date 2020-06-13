typedef struct ELE
{
    struct ELE *next;
    int data;
} list_ele, *list_ptr;


int list_len(list_ptr ls)
{
    int len = 0;
    while (ls)
    {
        len++;
        ls = ls->next;
    }
    return len;
}