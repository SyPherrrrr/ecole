CC=gcc
CFLAGS=-Wall -g
all: main


main: analyse_syntaxique.o pile.o analyse_lexicale.o main.o
	$(CC) $(CFLAGS) -o main analyse_syntaxique.o pile.o analyse_lexicale.o main.o

main.o: main.c analyse_lexicale.h analyse_syntaxique.h
	$(CC) $(CFLAGS) -c main.c

analyse_syntaxique.o: analyse_syntaxique.c analyse_lexicale.h pile.h
	$(CC) $(CFLAGS) -c analyse_syntaxique.c

pile.o: pile.c 
	$(CC) $(CFLAGS) -c pile.c

analyse_lexicale.o: analyse_lexicale.c
	$(CC) $(CFLAGS) -c analyse_lexicale.c

clean:
	rm -f  main *.o

