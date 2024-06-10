%{
#include <stdio.h>
%}

%%
[0-9]+      printf("Número: %s\n", yytext);
[a-zA-Z]+   printf("Palabra: %s\n", yytext);
"'".*."'"   printf("Cadena: %s\n", yytext);
"//".*      {/*Ignore*/}
"/*".*."*/" {/*Ignore*/}
"+"         printf("Suma: %s\n", yytext);
"-"         printf("Resta: %s\n", yytext);
"*"         printf("Multiplicado: %s\n", yytext);
"/"         printf("Dividir: %s\n", yytext);
"="         printf("Asignación: %s\n", yytext);
"=="         printf("Comparación: %s\n", yytext);
[ ]+        printf("Espacio: %s\n", yytext);
[\t]+       printf("Tabulacion: %s\n", yytext);
[\r]+       printf("Retorno de carro: %s\n", yytext);
\n          ; // Ignorar nuevas líneas
[ ,\t,\r,\n]+ {/*Ignore*/}
.           printf("ERROR: Carácter desconocido: %s\n", yytext);
%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}