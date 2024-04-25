#imput
texto = input("Texto: ")

#conta o numero de letras
letters = 0
for c in texto:
    if  c.isalpha():
        letters += 1

#conta o numero words
words = len(texto.split())

#conta o numero de sentences
sentences = texto.count(".") + texto.count("?") + texto.count("!")

#calculate average number of letters per 100
L = letters / words * 100
S = sentences / words *100

#calculate average number of sentences per 100
index = 0.0588 * L - 0.296 * S - 15.8


if index < 1:
    print("Before Grade 1")

elif index >= 16:
    print("Grade 16+")


else:
    print(f"Grade {round(index)}")