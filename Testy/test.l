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

"Utwórz zmienną" {  printf("1"); }
"o rozmiarze" { printf("2"); }
"Jeżeli" { printf("3");}
"Dopóki" { printf("4"); }
"to:" { printf("5"); }
"W przeciwnym razie" { printf("6"); }
{dot} { printf("7"); }
{comma} { printf("8"); }
{colon} { printf("9"); }
{plus} { printf("10"); }
{minus} { printf("11"); }
{intnumber} {
    printf("12");
}
{floatnumber} {
    printf("13");
    
   
}
{string} {
    printf("14");
}
{variable} {
    printf("15");
}
\n {printf("16");}

%%

int yywrap(void){
    
}

int main() {
    yylex();
    return 0;
}