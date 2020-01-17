%{
void yyerror (char *s);
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylineno; 

int number_of_int_var; //licznik zmiennych typu int
int number_of_float_var; //licznik zmiennych typu float
int number_of_string_var; //licznik zmiennych typu string

char** int_name_array; //tablica z nazwami intow
char** float_name_array; //tablica z nawami floatow
char** string_name_array; //tablica z nazwami stringow

int* int_array;//tablica z wartoscami intow
float* float_array;//tablica z wartoscami flaotow
char** string_array;//tablica z wartoscami stringow

void add_int_val(int val, char* name);//zapisz dana wartosc int do zmiennej
void add_float_val(float val, char* name);//zapisz dana wartosc float do zmiennej
void add_string_val(char* val, char* name);//zapisz dana wartosc string do zmiennej

void add_int_name(char* name);//utworz nowa nazwe zmiennej int
void add_float_name(char* name);//utworz nowa nazwe zmiennej float
void add_string_name(char* name);//utworz nowa nazwe zmiennej string

int get_int_val(char *name);//uzyskaj warotsc danej zmiennej int
float get_float_val(char *name);//uzyskaj wartosc danej zmiennej float
char* get_string_val(char* name);//uzyskazj wartosc danej zmiennej string

void print_val(char* name);
void VarVar(char* left,char* right);//funkcja do przypisywania zmiennej do zmiennej
int get_var_type(char *name);//uzyskaj typ zmiennej 0 - int,  1 - float, 2 - string

void print_int();
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
%token              OUT
%token              ENDLINE
%token              EQUALS
%token              PLUS
%token              MINUS
%token <intVal>     INT_VALUE
%token <floatVal>   FLOAT_VALUE
%token <strVal>     STRING_VALUE
%token <varName>    VARIABLE_NAME
%type  <intVal>     LINIE ASSIGMENT INT_EXP FLOAT_EXP ID_I ID_F


%%

<<<<<<< HEAD
LINIE   :   VARIABLE_DECLARATION SPACE ASSIGMENT DOT ENDLINE 
        |   LINIE VARIABLE_DECLARATION SPACE ASSIGMENT DOT ENDLINE 
        |   OUT SPACE VARIABLE_NAME DOT ENDLINE {print_val($3);}
        |   LINIE OUT SPACE VARIABLE_NAME DOT ENDLINE {print_int();}
=======
START   :   LINIE ENDLINE START
        |   ENDLINE START
        |   LINIE
        |
        ;

LINIE   :   VARIABLE_DECLARATION SPACE ASSIGMENT DOT
        |   LINIE VARIABLE_DECLARATION SPACE ASSIGMENT DOT
        |   OUT SPACE VARIABLE_NAME DOT {print_val($3);}
        |   LINIE OUT SPACE VARIABLE_NAME DOT {print_val($4);}
>>>>>>> 262dc5f9fe931ede0ef39667f8b738192c4f7c44
        ;

ASSIGMENT   :  VARIABLE_NAME {add_int_name($1);add_int_val(0,$1);}
            |  VARIABLE_NAME SPACE EQUALS SPACE VARIABLE_NAME {VarVar($1,$5); }
            |  VARIABLE_NAME SPACE EQUALS SPACE FLOAT_VALUE   {add_float_name($1);add_float_val($5,$1);}
            |  VARIABLE_NAME SPACE EQUALS SPACE INT_VALUE     {add_int_name($1);add_int_val($5,$1);}
            |  VARIABLE_NAME SPACE EQUALS SPACE STRING_VALUE {add_string_name($1); add_string_val($5, $1);}
            |  VARIABLE_NAME SPACE EQUALS SPACE INT_EXP       
            |  VARIABLE_NAME SPACE EQUALS SPACE FLOAT_EXP           
            ;


INT_EXP     :  INT_EXP SPACE PLUS SPACE INT_VALUE {printf("int a = 1 + 2.");}
            |  INT_EXP SPACE MINUS SPACE INT_VALUE {printf("int a = 1 - 2.");}
            |  ID_I
            ;

ID_I        : VARIABLE_NAME {printf("Zamiana zmienniej na liczbe RZUCA TYLKO INTY");}
            | INT_VALUE
            ;

FLOAT_EXP   : FLOAT_EXP SPACE PLUS SPACE FLOAT_VALUE {printf("int a = 1.1 + 2.2.");}
            | FLOAT_EXP SPACE MINUS SPACE FLOAT_VALUE {printf("int a = 1.1 - 2.2.");}
            | ID_F
            ;

ID_F        : VARIABLE_NAME {printf("Zamiana zmienniej na liczbe RZUCA TYLKO FLOATY");}
            | FLOAT_VALUE
            ;

%%

void add_int_name(char* name)
{
        number_of_int_var++;
<<<<<<< HEAD
        int_name_array = realloc((number_of_int_var) * sizeof(char*));
        int_array = realloc((number_of_int_var) * sizeof(int*));
        int_name_array[number_of_int_var-1] = malloc(sizeof(name));
=======
>>>>>>> 262dc5f9fe931ede0ef39667f8b738192c4f7c44
        strcpy(int_name_array[number_of_int_var-1], name);
}

void add_float_name(char* name)
{
        number_of_float_var++;
<<<<<<< HEAD
        float_name_array = (char**) realloc((number_of_float_var) * sizeof(char*));
        float_array = (char**) realloc((number_of_float_var) * sizeof(float*));
        float_name_array[number_of_float_var-1] = malloc(sizeof(name));
=======
>>>>>>> 262dc5f9fe931ede0ef39667f8b738192c4f7c44
        strcpy(float_name_array[number_of_float_var-1], name);
}

void add_string_name(char* name)
{
        number_of_string_var++;
        strcpy(string_name_array[number_of_string_var-1], name);
}

void add_int_val(int val,char* name)
{
        int i;
        for(i = 0;i<number_of_int_var;i++)
        {
            if(strcmp(name,int_name_array[i]) == 0)
            {
                int_array[i] = val;
                break;
            }
        }
}

void add_float_val(float val, char* name)
{
        int i;
        for(i = 0;i<number_of_float_var;i++)
        {
            if(strcmp(name,float_name_array[i]) == 0)
            {
                float_array[i] = val;
                break;
            }
        }
}

void add_string_val(char* val, char* name)
{
        int i;
        for(i = 0;i<number_of_string_var;i++)
        {
            if(strcmp(name,string_name_array[i]) == 0)
            {
                string_array[i] = val;
                break;
            }
        }
}

int get_int_val(char *name)
{
    int ret = 0;
    int i;
    for(i = 0;i<number_of_int_var;i++)
    {    
        if(strcmp(name,int_name_array[i]) == 0)
        {
        ret = int_array[i];
        return ret;
        }
    }
}

float get_float_val(char *name)
{
    float ret = 0;
    int i;
    for(i = 0;i<number_of_float_var;i++)
    {    
        if(strcmp(name,float_name_array[i]) == 0)
        {
        ret = float_array[i];
        return ret;
        }
    }
}

char* get_string_val(char *name)
{
    char* ret;
    int i;
    for(i = 0;i<number_of_string_var;i++)
    {    
        if(strcmp(name,string_name_array[i]) == 0)
        {
        ret = string_array[i];
        return ret;
        }
    }
}


int get_var_type(char *name)
{
    int j;
        for(j = 0;j< number_of_int_var;j++)
        {
            if(strcmp(name,int_name_array[j]) == 0)
            {
                return 0;
            }
        }
        for(j = 0;j< number_of_float_var;j++)
        {
            if(strcmp(name,float_name_array[j]) == 0)
            {
                return 1;
            }
        }
        for(j = 0;j< number_of_string_var;j++)
        {
            if(strcmp(name,string_name_array[j]) == 0)
            {
                return 2;
            }           
        }
    return -1;
}

void VarVar(char* left,char* right)
{
    int type = get_var_type(right);
    if(type == 0)
    {
        add_int_name(left);
        add_int_val(get_int_val(right),left);
    }
    if(type == 1)
    {
        add_float_name(left);
        add_float_val(get_float_val(right),left);
    }
    if(type == 2)
    {
        add_string_name(left);
        add_string_val(get_string_val(right),left);
    }
}

void print_val(char* name)
{
    int type = get_var_type(name);
    int j;
    if(type == 0)
    {
    for(j = 0;j< number_of_int_var;j++)
        {
            if(strcmp(name,int_name_array[j]) == 0)
            {
                printf("%d\n",get_int_val(name));
            }
        }
    }
    if(type == 1)
    {
    for(j = 0;j< number_of_float_var;j++)
        {
            if(strcmp(name,float_name_array[j]) == 0)
            {
                printf("%.1f\n",get_float_val(name));
            }
        }
    }
    if(type == 2)
    {
        ;
    }
}

void print_int()
{
    int i;
    for(i = 0 ; i< number_of_int_var;i++)
    {
        printf("%d\n",int_array[i]);
    }
}

int main(void) {

    int i = 0;

    int_name_array = malloc(1024 * sizeof(char*));
    for (i = 0; i < 1024; i++) int_name_array[i] = malloc((64) * sizeof(char));

    float_name_array = malloc(1024 * sizeof(char*));
    for (i = 0; i < 1024; i++) float_name_array[i] = malloc((64) * sizeof(char));

    string_name_array = malloc(1024 * sizeof(char*));
    for (i = 0; i < 1024; i++) string_name_array[i] = malloc((64) * sizeof(char));

    int_array = malloc(1024 * sizeof(int*));
    float_array = malloc(1024 * sizeof(float*));

    string_array = malloc(1024 * sizeof(char*));
    for (i = 0; i < 1024; i++) string_name_array[i] = malloc((1024) * sizeof(char));

    number_of_int_var = 0;
    number_of_float_var = 0;
    number_of_string_var = 0;
    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "line %d: %s\n", yylineno, s);
}