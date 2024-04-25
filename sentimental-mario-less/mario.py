def main():
    height = get_height()
    for i in range(1, height + 1):
        print(" " * (height - i) + "#" * i)


def get_height():
    while True:
        try:
            n = int(input("Height: "))
            if n >= 1 and n <= 8:
                return n
            print("Escolha um valor entre 1 e 8")
        except ValueError:
            print("Not an integer")


main()
