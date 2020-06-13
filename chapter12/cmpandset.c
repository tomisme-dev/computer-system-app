int xchange(int *ptr, int expect, int dest) {
    if(*ptr == expect) {
        *ptr = dest;
        return 1;
    }

    return 0;
}

int cmp(int a, int b) {
    return a > b;
}