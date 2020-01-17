flex lexer.l
bison -y -d parser.y
gcc -c lex.yy.c y.tab.c
gcc y.tab.o lex.yy.o -o test.exe
.\test.exe < test.jpj