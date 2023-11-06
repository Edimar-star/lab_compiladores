#!/bin/bash

flex -o LAB01.cpp LAB01.l
yacc -d -o LAB02.cpp LAB02.y
g++ -o LAB02 LAB01.cpp LAB02.cpp -lfl
./LAB02 entrada.txt > salida.txt
cat salida.txt