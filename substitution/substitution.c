#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(int argc, string argv[])
{
    // check do argumento da linha de comando
    if (argc != 2)
    {
        printf("Usage: ./susbtitution key\n");
        return 1;
    }

    // Validação se a key são somente letras do alfabeto
    string key = argv[1];
    for (int i = 0; i < strlen(key); i++)
    {
        if (!isalpha(key[i]))
        {
            printf("Usage: /susbtitution key\n");
            return 1;
        }
    }

    // valida se a key consiste em 26 caracteres
    if (strlen(key) != 26)
    {
        printf("Key must contain 26 characters\n");
        return 1;
    }

    // Valida se cada caracter na key é unico
    for (int i = 0; i < strlen(key); i++)
    {
        for (int j = i + 1; j < strlen(key); j++)
        {
            if ((toupper(key[i])) == toupper(key[j]))
            {
                printf("Usage: /susbtitution key\n");
                return 1;
            }
        }
    }
    // Pronpt de texto do usuario
    string plaintext = get_string("plaintext: ");

    // Coverter todas as letras do alfabeto em maiuscula
    for (int i = 0; i < strlen(key); i++)
    {
        if (islower(key[i]))
        {
            key[i] = key[i] - 32;
        }
    }

    // texto codificado
    printf("ciphertext: ");

    for (int i = 0; i < strlen(plaintext); i++)
    {
        if (isupper(plaintext[i]))
        {
            int letter = plaintext[i] - 65;
            printf("%c", key[letter]);
        }
        else if (islower(plaintext[i]))
        {
            int letter = plaintext[i] - 97;
            printf("%c", key[letter] + 32);
        }
        else
            printf("%c", plaintext[i]);
    }
    printf("\n");
}