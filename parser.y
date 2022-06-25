/*
    Analyser Bison

*/
%{
#include <stdio.h>
#include <stdlib.h>
#include "parserfiles.h"

int yylex();
int yyparse();

%}

%union {
	struct ast *a;
	double d;
	struct symbol *s; /* qual simbolo? */
	struct symlist *sl; 
	int fn; /* qual funcao? */
}


%%

%%

int yyerror (char *s){
  return printf("Erro encontrado: %s linha %i\n", s, yylineno);
}