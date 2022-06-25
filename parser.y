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