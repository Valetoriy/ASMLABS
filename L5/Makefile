# common
C = gcc -Wall -Wextra -Wpedantic -fsanitize=address,undefined
A = yasm -f elf64
# compile-only args
CO = -c

S = src/
O = obj/

OBJS = $(O)main.o $(O)afunc.o
all: $(OBJS)
	$(C) $(OBJS) -fno-pie -no-pie -o L5

$(O)main.o: $(S)main.c
	$(C) $(CO) $(S)main.c -o $(O)main.o

$(O)afunc.o: $(S)afunc.asm
	$(A) $(S)afunc.asm -o $(O)afunc.o

clean:
	rm $(O)*.o && rm L5
