#!/bin/sh

yasm -f elf32 afuncs.asm -o afuncs.o
gcc -Ofast -m32 afuncs.o funcs.c L1.c -o L1
./L1
