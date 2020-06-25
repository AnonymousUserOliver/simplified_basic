# Simplified Basic

## What is it? 
A Flex scanner and a Bison parser that accepts a simplied version of Basic language based on Dr. Dobb's "Tiny Basic". The parser does not actually execute the program

## How to build and test?
```
flex basic.l

bison -d basic.y

g++ basic.tab.c lex.yy.c -o basic

./basic
```