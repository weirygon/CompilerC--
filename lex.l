
/*      Analyser Flex       */

%option noyywrap yylineno
%{
	#include <string.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include "parser.tab.h"

    int yylex();
    int yyparse();

    int yyerror (char *s){
        return printf("Erro encontrado: %s linha %i\n", s, yylineno);
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
.
%%

int main(){
    printf("> ");
    return yyparse();
}
