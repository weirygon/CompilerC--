/*
    Analyser Bison

*/
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyparse();

#include "parserfiles.h"

%}
%%

%%

int yyerror (char *s){
  return printf("Erro encontrado: %s linha %i\n", s, yylineno);
}