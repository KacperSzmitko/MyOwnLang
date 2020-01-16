%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}
%option yylineno

space ([ ])
tab (\t)
endline (\n)
intnumber ([\-]?[0-9]+)
floatnumber ([\-]?[0-9]*,?[0-9]+)
string (\"(\\.|[^"])*\")
variable ([a-zA-Z][_a-zA-Z0-9]*)
dot (\.)
comma (,)
colon (:)
equals (=)
plus (\+)
minus (\-)


%%

"Utwórz zmienną" { return VARIABLE_DECLARATION; }
"Wyświetl zmienną" { return OUT; }
"Jeżeli" { return IF_START; }
"Dopóki" { return WHILE_START; }
"to:" { return THEN; }
"W przeciwnym razie" { return ELSE; }
{dot} { return DOT; }
{comma} { return COMMA; }
{colon} { return COLON; }
{space} {return SPACE; }
{equals} { return EQUALS; }
{plus} { return PLUS; }
{minus} { return MINUS; }
{intnumber} {
    yylval.intVal = atoi(yytext); 
    return INT_VALUE;
}
{floatnumber} {
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

