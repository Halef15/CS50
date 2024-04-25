#include <cs50.h>
#include <stdio.h>

int main(void)

{

    int n;
    do
    {
        n = get_int("tamanho:");
    }
    while (n < 1 || n > 8);

    for (int i = 0; i < n; i++)

    {
        for (int e = 0; e < n - i - 1; e++) // espaços
        {
            printf(" ");
        }
        for (int j = 0; j <= i; j++)
        {
            printf("#");
        }

        printf("  ");
        for (int j = 0; j <= i; j++)
        {
            printf("#");
        }

        printf("\n");
    }
}
