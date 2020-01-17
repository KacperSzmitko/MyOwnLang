bison -y -d parser.y
flex lexer.l
gcc -c lex.yy.c y.tab.c
gcc y.tab.o lex.yy.o -o test.exe
.\test.exe < test.jpj