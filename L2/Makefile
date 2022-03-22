# common
C = gcc -Wall -Wextra -Wpedantic -fsanitize=address,undefined
# compile-only args
CO = -c

S = src/
O = obj/

OBJS = $(O)main.o $(O)funcs.o $(O)afuncs.o
all: $(OBJS)
	$(C) $(OBJS) -fno-pie -no-pie -o L2

$(O)main.o: $(S)main.c
	$(C) $(CO) $(S)main.c -o $(O)main.o

$(O)funcs.o: $(S)funcs.c
	$(C) $(CO) $(S)funcs.c -o $(O)funcs.o

$(O)afuncs.o: $(S)afuncs.asm
	yasm -f elf64 $(S)afuncs.asm -o $(O)afuncs.o

clean:
	rm $(O)*.o && rm L2
