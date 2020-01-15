%{
#include <stdio.h>
#include <string.h>
%}

space ( )
tab (\t)
endline (\n)
intnumber (\-]?[0-9]+)
floatnumber ([\-]?[0-9]*,?[0-9]+)
string (\"(\\.|[^"])*\")
variable ([a-zA-Z][_a-zA-Z0-9]*)
dot (\.)
comma (,)
colon (:)
plus (\+)
minus (\-)


%%

"Utwórz zmienną" { return VARIABLE_DECLARATION; printf("TEST"); }
"o rozmiarze" { return TABLE_SIZE_DECLARATION; }
"Jeżeli" { return IF_START; }
"Dopóki" { return WHILE_START; }
"to:" { return THEN; }
"W przeciwnym razie" { return ELSE; }
{dot} { return DOT; }
{comma} { return COMMA; }
{colon} { return COLON; }
{plus} { return PLUS; }
{minus} { return MINUS; }
{intnumber} {
    yylval.intVal = atoi(yytext); 
    return INT_VALUE;
}
{floatnumber} {
    char* sf = malloc(sizeof(yytext));
    for (int i = 0; i < (sizeof(yytext) / sizeof(char)); i++) {
        if (yytext[i] != ',') sf[i] = yytext[i];
        else sf[i] = '.';
    }
    yylval.floatVal = atof(s);
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

%%

int yywrap(void){
    return 1;
}

