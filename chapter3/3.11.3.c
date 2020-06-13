#include <stdio.h>
double funct(double a, float x, double b, int i)
{
    return a * x - b / i;
}

float funct2(double a, float x, double b, int i)
{
    return x + i;
}

double cel2fahr(double temp)
{
    return 1.8 * temp + 32.0;
}

struct Animal
{
    char *name;
    int age;
    void (*hello)(struct Animal*);
};

void say(struct Animal *a)
{
    printf("age is %d\n", a->age);
}
    
int main(int argc, char const *argv[])
{
    struct Animal animal;
    animal.age = 18;
    animal.hello = say;
    // void (*hello)(struct Animal*) = say;
    animal.hello(&animal);
    // say(&animal);
    return 0;
}
