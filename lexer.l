%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%option yylineno

space ([ ])
tab (\t)
endline (\n)
int_number ([\-]?[0-9]+)
float_number ([\-]?[0-9]*,?[0-9]+)
string (\"(\\.|[^"])*\")
variable ([a-zA-Z][_a-zA-Z0-9]*)
dot (\.)
comma (,)
colon (:)
equals (=)
plus (\+)
minus (\-)
mul (\*)
div (\/)
mod (%)
equal (==)
not_equal (!=)
greater (>)
less (<)
greater_or_equal (>=)
less_or_equal (<=)

%%

"Utwórz zmienną" { return VARIABLE_DECLARATION; }
"Wyświetl" { return PRINT; }
"Jeżeli" { return IF_START; }
"Dopóki" { return WHILE_START; }
"to:" { return THEN; }
"Otwórz plik o nazwie" { return OPEN_FILE; }
"Odczytaj z pliku do zmiennej" { return READ_FILE; }
"Wpisz do pliku" { return WRITE_FILE; }
"Zamknij plik" { return CLOSE_FILE; }
{dot} { return DOT; }
{comma} { return COMMA; }
{colon} { return COLON; }
{space} {return SPACE; }
{tab}   {return TAB;}
{equals} { return EQUALS; }
{plus} { return PLUS; }
{minus} { return MINUS; }
{mul} { return MUL; }
{div} { return DIV; }
{mod} { return MOD; }
{equal} { return EQUAL; } 
{not_equal} { return NOT_EQUAL; } 
{greater} { return GREATER; }
{less} { return LESS; }
{greater_or_equal} { return GREATER_OR_EQUAL; } 
{less_or_equal} { return LESS_OR_EQUAL; }
{int_number} {
    yylval.intVal = atoi(yytext); 
    return INT_VALUE;
}
{float_number} {
    char* sf = malloc(sizeof(char) * yyleng);
    int i = 0;
    for (i; i < (sizeof(yytext) / sizeof(char)); i++) {
        if (yytext[i] != ',') sf[i] = yytext[i];
        else sf[i] = '.';
    }
    yylval.floatVal = atof(sf);
    return FLOAT_VALUE;
}
{string} {
    char* s = (char*)calloc(yyleng - 2, sizeof(char));
    int i;
    for (i = 1; i < yyleng - 1; i++) s[i-1] = yytext[i];
    yylval.strVal = strdup(s);
    return STRING_VALUE;
}
{variable} {
    yylval.varName = strdup(yytext);
    return VARIABLE_NAME;
}
{endline} {
    yylineno++;
    return ENDLINE;
}


%%

int yywrap(void){
    return 1;
}

