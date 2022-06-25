
/*      Analyser Flex       */

%option noyywrap yylineno
%{
	#include <string.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include "parser.tab.h"

    int yylex();
    int yyparse();

    void yyerror(char *s, ...){
        va_list ap;

        fprintf(stderr, "%d: error: ", yylineno);
        vfprintf(stderr, s, ap);
        fprintf(stderr, "\n");
    }



%}

letter      [a-zA-Z]
digit       [0-9]
id          (letter{letter|digit|_})
intcon      (digit{digit})
charcon     ('ch'|'\n'|'\0')
stringcon   ("{ch}")



%%

"+" | /* operadores de caracter unico */
"-" |
"*" |
"/" |
"=" |
"," |
";" |
"(" |
")"     { return yytext[0]; }


"//".*
[ \t] /* ignora espaco em branco*/

\\\n 	{ printf("c> "); } /* ignora continuacao de linha */

\n 	{ return EOL; }
.   { yyerror("Caracter desconhecido %c\n", *yytext); };
%%

int main(void ){

    printf("> ");
    return yyparse();

}
