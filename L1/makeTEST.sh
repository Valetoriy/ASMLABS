#!/bin/sh

# yasm -f elf32 afuncs.asm -o afuncs.o
yasm -f elf64 afuncs.asm -o afuncs.o
# gcc -Ofast -m32 afuncs.o funcs.c L1.c -o L1
gcc -Ofast -fno-pie -no-pie afuncs.o TEST.c -o TEST
./TEST
