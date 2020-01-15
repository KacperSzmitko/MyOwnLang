%{
void yyerror (char *s);
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylineno; 
%}

%union {int intVal; float floatVal;char* strVal;char* varName;}
%start              LINIE
%token              VARIABLE_DECLARATION
%token              IF_START
%token              WHILE_START
%token              THEN
%token              ELSE
%token              DOT
%token              COMMA
%token              COLON
%token              PLUS
%token              MINUS
%token <intVal>     INT_VALUE
%token <floatVal>   FLOAT_VALUE
%token <strVal>     STRING_VALUE
%token <varName>    VARIABLE_NAME
%type  <intVal>      LINIE EXP TYPE ASSIGMENT OPP


%%

LINIE   :   ASSIGMENT DOT   {printf("cze");}
        |   LINIE ASSIGMENT {;} 
        ;

ASSIGMENT : VARIABLE_DECLARATION EXP
          ;

EXP     : VARIABLE_NAME '=' OPP
        ;

OPP     : TYPE
        | OPP PLUS TYPE
        | OPP MINUS TYPE {$$ = $1 - $3;}
        | TYPE PLUS TYPE
        | TYPE MINUS TYPE
        ;

TYPE    : INT_VALUE {printf("cze");}
        | FLOAT_VALUE {$$ = $1;}
        | STRING_VALUE {;}
        | VARIABLE_NAME {;}
        ;


%%

int main(void) {

    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "line %d: %s\n", yylineno, s);
}