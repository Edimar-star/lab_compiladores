#!/bin/bash

sudo apt-get install flex
flex -o LAB01.cpp LAB01.l
g++ -o LAB01 LAB01.cpp -lfl
./LAB01 entrada.txt > salida.txt
cat salida.txt