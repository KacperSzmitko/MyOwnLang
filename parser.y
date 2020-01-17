%{
#include "functions.h"
extern int yylineno; 
void yyerror (char *s);

%}

%union {int intVal; float floatVal;char* strVal;char* varName;}
%start              START
%token              VARIABLE_DECLARATION
%token              IF_START
%token              WHILE_START
%token              THEN
%token              ELSE
%token              DOT
%token              COMMA
%token              COLON
%token              SPACE
%token              TAB
%token              PRINT
%token              ENDLINE
%token              EQUALS
%token              PLUS
%token              MINUS
%token              MUL
%token              DIV
%token              MOD
%token              EQUAL
%token              NOT_EQUAL
%token              GREATER
%token              LESS
%token              GREATER_OR_EQUAL
%token              LESS_OR_EQUAL
%token <intVal>     INT_VALUE
%token <floatVal>   FLOAT_VALUE
%token <strVal>     STRING_VALUE
%token <varName>    VARIABLE_NAME
%type  <intVal>     ASSIGMENT INT_EXP ID_I IF_OP CONDITION
%type  <floatVal>   FLOAT_EXP ID_F

%%

START       :   TABS LINE ENDLINE TABS_CLEAR START
            |   TABS ENDLINE TABS_CLEAR START 
            |   TABS LINE      
            |   TABS               
            ;

TABS        :   TAB TABS {tabs_level++;}
            |   SPACE SPACE SPACE SPACE TABS {tabs_level++;}
            |   SPACE SPACE SPACE
            |   SPACE SPACE
            |   SPACE
            |   
            ;

TABS_CLEAR  :   {tabs_level = 0;}

LINE        :   VARIABLE_DECLARATION SPACE ASSIGMENT DOT
            |   PRINT SPACE VARIABLE_NAME DOT {print_val($3);}
            |   ASSIGMENT DOT
            |   IF_START SPACE CONDITION COMMA SPACE THEN
            ;

CONDITION   :  VARIABLE_NAME SPACE IF_OP SPACE VARIABLE_NAME    {check_var_var($1, $3, $5);}
            |  VARIABLE_NAME SPACE IF_OP SPACE INT_VALUE        {check_var_int($1, $3, $5);}
            |  VARIABLE_NAME SPACE IF_OP SPACE FLOAT_VALUE      {check_var_float($1, $3, $5);}
            |  VARIABLE_NAME SPACE IF_OP SPACE STRING_VALUE     {check_var_string($1, $3, $5);}
            |  VARIABLE_NAME SPACE IF_OP SPACE INT_EXP          {check_var_int($1, $3, $5);}
            |  VARIABLE_NAME SPACE IF_OP SPACE FLOAT_EXP        {check_var_float($1, $3, $5);}
            ;

IF_OP       :  EQUAL                                            {$$ = 1;}
            |  NOT_EQUAL                                        {$$ = 2;}
            |  GREATER                                          {$$ = 3;}
            |  LESS                                             {$$ = 4;}
            |  GREATER_OR_EQUAL                                 {$$ = 5;}
            |  LESS_OR_EQUAL                                    {$$ = 6;}
            ;                                        

ASSIGMENT   :  VARIABLE_NAME                                    {add_int_name($1);add_int_val(0,$1);}
            |  VARIABLE_NAME SPACE EQUALS SPACE VARIABLE_NAME   {VarVar($1,$5);}
            |  VARIABLE_NAME SPACE EQUALS SPACE FLOAT_VALUE     {add_float_name($1);add_float_val($5,$1);}
            |  VARIABLE_NAME SPACE EQUALS SPACE INT_VALUE       {add_int_name($1);add_int_val($5,$1);}
            |  VARIABLE_NAME SPACE EQUALS SPACE STRING_VALUE    {add_string_name($1); add_string_val($5, $1);}
            |  VARIABLE_NAME SPACE EQUALS SPACE FLOAT_EXP       {add_float_name($1);add_float_val($5,$1);}  
            |  VARIABLE_NAME SPACE EQUALS SPACE INT_EXP         {add_int_name($1);add_int_val($5,$1);}   
            ;


INT_EXP     :  INT_EXP SPACE PLUS SPACE ID_I                    {$$ = $1 + $5;}
            |  INT_EXP SPACE MINUS SPACE ID_I                   {$$ = $1 - $5;}
            |  ID_I SPACE PLUS SPACE ID_I                       {$$ = $1 + $5;}
            |  ID_I SPACE MINUS SPACE ID_I                      {$$ = $1 - $5;}
            |  INT_EXP SPACE MUL SPACE ID_I                     {$$ = $1 * $5;}
            |  INT_EXP SPACE DIV SPACE ID_I                     {$$ = $1 / $5;}
            |  ID_I SPACE MUL SPACE ID_I                        {$$ = $1 * $5;}
            |  ID_I SPACE DIV SPACE ID_I                        {$$ = $1 / $5;}
            |  INT_EXP SPACE MOD SPACE ID_I                     {$$ = $1 % $5;}
            |  ID_I SPACE MOD SPACE ID_I                        {$$ = $1 / $5;}
            ;

ID_I        : VARIABLE_NAME                                     {$$ = get_int_val($1);}
            | INT_VALUE                                         {$$ = $1;}
            ;

FLOAT_EXP   :  FLOAT_EXP SPACE PLUS SPACE ID_F                  {$$ = $1 + $5;}
            |  FLOAT_EXP SPACE MINUS SPACE ID_F                 {$$ = $1 - $5;}
            |  ID_F SPACE PLUS SPACE ID_F                       {$$ = $1 + $5;}
            |  ID_F SPACE MINUS SPACE ID_F                      {$$ = $1 - $5;}
            |  FLOAT_EXP SPACE MUL SPACE ID_F                   {$$ = $1 * $5;}
            |  FLOAT_EXP SPACE DIV SPACE ID_F                   {$$ = $1 / $5;}
            |  ID_F SPACE MUL SPACE ID_F                        {$$ = $1 * $5;}
            |  ID_F SPACE DIV SPACE ID_F                        {$$ = $1 / $5;}
            |  FLOAT_EXP SPACE MOD SPACE ID_F                   {$$ = $1 / $5;}
            |  ID_F SPACE MOD SPACE ID_F                        {$$ = $1 / $5;}
            ;

ID_F        : VARIABLE_NAME                                     {$$ = get_float_val($1);}
            | FLOAT_VALUE                                       {$$ = $1;}
            ;

%%


int main(void) {
    init();
    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "line %d: %s\n", yylineno, s);
}