# common
C = gcc -Wall -Wextra -Wpedantic -fsanitize=address,undefined
A = yasm -f elf64
# compile-only args
CO = -c

S = src/
O = obj/

OBJS = $(O)main.o $(O)funcs.o $(O)afuncs.o
all: $(OBJS)
	$(C) $(OBJS) -fno-pie -no-pie -o L3

$(O)main.o: $(S)main.asm
	$(A) $(S)main.asm -o $(O)main.o

$(O)funcs.o: $(S)funcs.asm
	$(A) $(S)funcs.asm -o $(O)funcs.o

$(O)afuncs.o: $(S)afuncs.asm
	$(A) $(S)afuncs.asm -o $(O)afuncs.o

clean:
	rm $(O)*.o && rm L3
