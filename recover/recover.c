#include <stdint.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
    typedef uint8_t BYTE;
    BYTE buffer[512];
    int bytes_read, count = 0;
    char filename[8];

    FILE *f = fopen(argv[1], "r");
    FILE *img = NULL;

    if (argc != 2 || f == NULL)
    {
        printf("Usage: ./recover IMAGE\n");
        return 1;
    }

    while (1)
    {
        bytes_read = fread(buffer, sizeof(BYTE), 512, f);
        if (bytes_read == 0)
        {
            break;
        }

        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            if (img != NULL)
            {
                fclose(img);
            }

            sprintf(filename, "%03i.jpg", count);
            img = fopen(filename, "w");

            if (img == NULL)
            {
                fclose(f);
                fprintf(stderr, "Could not create output file.\n");
                return 2;
            }

            fwrite(buffer, sizeof(BYTE), bytes_read, img);
            count++;
        }
        else if (count > 0)
        {
            fwrite(buffer, sizeof(BYTE), bytes_read, img);
        }
    }

    if (img != NULL)
    {
        fclose(img);
    }

    fclose(f);
    return 0;
}
