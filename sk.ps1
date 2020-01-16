flex lexer.l
yacc -y -d parser.y
gcc -c lex.yy.c y.tab.c
gcc y.tab.o lex.yy.o -o test.exe
cmd /c '.\test < test.jpj'