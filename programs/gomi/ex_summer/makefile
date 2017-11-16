CC = gcc

block:block.o ballgame.o
	$(CC) block.o ballgame.o -lncurses -o block
block.o:block.c
	$(CC) block.c -c
ballgame.o:ballgame.h ballgame.c
	$(CC) ballgame.c -c
