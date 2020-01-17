#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int level;
int tabs_level;


int number_of_int_var; //licznik zmiennych typu int
int number_of_float_var; //licznik zmiennych typu float
int number_of_string_var; //licznik zmiennych typu string

char** int_name_array; //tablica z nazwami intow
char** float_name_array; //tablica z nawami floatow
char** string_name_array; //tablica z nazwami stringow

int* int_array;//tablica z wartoscami intow
float* float_array;//tablica z wartoscami flaotow
char** string_array;//tablica z wartoscami stringow

void init(); //Inicjalizacja zmiennych globalnych

int check_tabs();

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

void check_var_var(char* left, int op, char* right);
void check_var_int(char* left, int op, int right);
void check_var_float(char* left, int op, float right);
void check_var_string(char* left, int op, char* right);
void check_int_int(int left, int op, int right);
void check_float_float(float left, int op, float right);
void check_string_string(char* left, int op, char* right);
void check_int_float(int left, int op, float right);
void check_float_int(float left, int op, int right);

void init() {
    level = 0;
    tabs_level = 0;
    number_of_int_var = 0;
    number_of_float_var = 0;
    number_of_string_var = 0;

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
}

int check_tabs() {
    if (tabs_level == level) {
        return 1;
    }
    else if (tabs_level < level) {
        level--;
        return 1;
    } else {
        return 0;
    }
}

void add_int_name(char* name)
{
    if (check_tabs() == 0) return;
    number_of_int_var++;
    strcpy(int_name_array[number_of_int_var-1], name);
}

void add_float_name(char* name)
{
    if (check_tabs() == 0) return;
    number_of_float_var++;
    strcpy(float_name_array[number_of_float_var-1], name);
}

void add_string_name(char* name)
{
    if (check_tabs() == 0) return;
    number_of_string_var++;
    strcpy(string_name_array[number_of_string_var-1], name);
}

void add_int_val(int val,char* name)
{
    if (check_tabs() == 0) return;
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
    if (check_tabs() == 0) return;
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
    if (check_tabs() == 0) return;
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
    if (check_tabs() == 0) return 0;

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
    if (check_tabs() == 0) return 0.0f;

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
    if (check_tabs() == 0) return 0;

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
    if (check_tabs() == 0) return 0;

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
    if (check_tabs() == 0) return;

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
    if (check_tabs() == 0) return;
    
    int type = get_var_type(name);
    int j;
    if(type == 0)
    {
    for(j = 0;j< number_of_int_var;j++)
        {
            if(strcmp(name,int_name_array[j]) == 0)
            {
                printf("%d\n",get_int_val(name));
                return;
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
                return;
            }
        }
    }
    if(type == 2)
    {
        ;
    }
}

void check_var_var(char* left, int op, char* right) {
    if (check_tabs() == 0) return;

    int left_type = get_var_type(left);
    int right_type = get_var_type(right);

    if (right_type == 0 && left_type == 0) {
        check_int_int(get_int_val(left), op, get_int_val(right));
    }
    else if (right_type == 1 && left_type == 1) {
        check_float_float(get_float_val(left), op, get_float_val(right));
    }
    else if (right_type == 2 && left_type == 2) {
        check_string_string(get_string_val(left), op, get_string_val(right));
    } 
    else if (right_type == 0 && left_type == 1) {
        check_int_float(get_int_val(left), op, get_float_val(right));
    }
    else if (right_type == 1 && left_type == 0) {
        check_float_int(get_float_val(left), op, get_int_val(right));
    }
    else {
        //ERROR
    }
    
}

void check_var_int(char* left, int op, int right) {
    if (check_tabs() == 0) return;

    int left_type = get_var_type(left);
    if (left_type == 0) {
        check_int_int(get_int_val(left), op, right);
    }
    else if (left_type == 1) {
        check_float_int(get_float_val(left), op, right);
    }
    else {
        //ERROR
    }
}

void check_var_float(char* left, int op, float right) {
    if (check_tabs() == 0) return;

    int left_type = get_var_type(left);
    if (left_type == 0) {
        check_int_float(get_int_val(left), op, right);
    }
    else if (left_type == 1) {
        check_float_float(get_float_val(left), op, right);
    }
    else {
        //ERROR
    }
}

void check_var_string(char* left, int op, char* right) {
    if (check_tabs() == 0) return;

    int left_type = get_var_type(left);
    if (left_type == 2) {
        check_string_string(get_string_val(left), op, right);
    }
    else {
        //ERROR
    }
}

void check_int_int(int left, int op, int right) {
    if (check_tabs() == 0) return;

    switch (op) {
    case 1: //EQUAL
        if (left == right) level++;
        break;
    case 2: //NOT_EQUAL
        if (left != right) level++;
        break;
    case 3: //GREATER
        if (left > right) level++;
        break;
    case 4: //LESS
        if (left < right) level++;
        break;
    case 5: //GREATER_OR_EQUAL
        if (left >= right) level++;
        break;
    case 6: //LESS_OR_EQUAL
        if (left <= right) level++;
        break;
    default:
        //ERROR
        break;
    }
}

void check_float_float(float left, int op, float right) {
    if (check_tabs() == 0) return;

    switch (op) {
    case 1: //EQUAL
        if (left == right) level++;
        break;
    case 2: //NOT_EQUAL
        if (left != right) level++;
        break;
    case 3: //GREATER
        if (left > right) level++;
        break;
    case 4: //LESS
        if (left < right) level++;
        break;
    case 5: //GREATER_OR_EQUAL
        if (left >= right) level++;
        break;
    case 6: //LESS_OR_EQUAL
        if (left <= right) level++;
        break;
    default:
        //ERROR
        break;
    }
}

void check_string_string(char* left, int op, char* right) {
    if (check_tabs() == 0) return;

    switch (op) {
    case 1: //EQUAL
        if (strcmp(left, right) == 0) level++;
        break;
    case 2: //NOT_EQUAL
        if (strcmp(left, right) != 0) level++;
        break;
    case 3: //GREATER
        if (strcmp(left, right) > 0) level++;
        break;
    case 4: //LESS
        if (strcmp(left, right) < 0) level++;
        break;
    case 5: //GREATER_OR_EQUAL
        if (strcmp(left, right) >= 0) level++;
        break;
    case 6: //LESS_OR_EQUAL
        if (strcmp(left, right) <= 0) level++;
        break;
    default:
        //ERROR
        break;
    }
}

void check_int_float(int left, int op, float right) {
    if (check_tabs() == 0) return;

    int int_right = (int)right;
    switch (op) {
    case 1: //EQUAL
        if (left == int_right) level++;
        break;
    case 2: //NOT_EQUAL
        if (left != int_right) level++;
        break;
    case 3: //GREATER
        if (left > int_right) level++;
        break;
    case 4: //LESS
        if (left < int_right) level++;
        break;
    case 5: //GREATER_OR_EQUAL
        if (left >= int_right) level++;
        break;
    case 6: //LESS_OR_EQUAL
        if (left <= int_right) level++;
        break;
    default:
        //ERROR
        break;
    }
}

void check_float_int(float left, int op, int right) {
    if (check_tabs() == 0) return;

    int int_left = (int)left;
    switch (op) {
    case 1: //EQUAL
        if (int_left == right) level++;
        break;
    case 2: //NOT_EQUAL
        if (int_left != right) level++;
        break;
    case 3: //GREATER
        if (int_left > right) level++;
        break;
    case 4: //LESS
        if (int_left < right) level++;
        break;
    case 5: //GREATER_OR_EQUAL
        if (int_left >= right) level++;
        break;
    case 6: //LESS_OR_EQUAL
        if (int_left <= right) level++;
        break;
    default:
        //ERROR
        break;
    }
}
