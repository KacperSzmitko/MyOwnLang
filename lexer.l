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
"W przeciwnym razie" { return ELSE; }
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
    char* sf = malloc(sizeof(yytext));
    int i = 0;
    for (i; i < (sizeof(yytext) / sizeof(char)); i++) {
        if (yytext[i] != ',') sf[i] = yytext[i];
        else sf[i] = '.';
    }
    yylval.floatVal = atof(sf);
    return FLOAT_VALUE;
}
{string} {


    yylval.strVal = strdup(yytext);
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

