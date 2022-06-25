%option noyywrap yylineno
%{
	#include <string.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include "sintatico.tab.h"
%}


letter      [a-zA-Z]
digit       [0-9]
id          (letter{letter|digit|_})
intcon      (digit{digit})
charcon     ('ch'|'\n'|'\0')
stringcon   ("{ch}")

%%

%%
int main(){
    printf("> ");
    return yyparse();
}