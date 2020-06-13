int main(int argc, char const *argv[])
{
    int arr[2] = {1, 2};
    arr[3] = 6;
    return 0;
}


int swi(int type) {
    int sum = 0;
    switch (type)
    {
    case 100:
        sum = type;
        /* code */
        break;
    case 101:
        sum = 2* type;
        break;
    case 102:
        sum = type + 7;
        break;
    case 103:
        sum = type * 7;
        break;
    default:
        sum = type - 9;
        break;
    }
    return sum;
}