
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

"!" | /* single character operators */
"+" |
"-" |
"*" |
"/" |
"=" |
"," |
";" |
"(" |
")" | 
"<" |
">" |
"[" |
"]" |
"{" |
"}"  { return yytext[0]; }

"void"      { return VOID;  }
"if"        { return IF;    }
"else"      { return ELSE;  }
"for"       { return FOR;   }
"while"     { return WHILE; }
"return"    { return RETURN;}

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
