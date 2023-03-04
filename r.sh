#!/bin/bash

# Program: Pythagoras
# Author: William Phung

# Clear any previously compiled outputs
rm *.o
rm *.out

echo "Assemble pythagoras.asm"
nasm -f elf64 -l pythagoras.lis -o pythagoras.o pythagoras.asm

echo "compile driver.cpp using g++ compiler standard 2020"
g++ -c -Wall -m64 -o driver.o driver.cpp -std=c++20

echo "Link object files using the g++ Linker standard 2020"
g++ -m64 -o pythagoras.out driver.o pythagoras.o -std=c++20

echo "Run the Pythagoras Program:"
./pythagoras.out

# For cleaner working directory, you can:
rm *.lis
rm *.o
rm *.out

echo "Script file terminated."