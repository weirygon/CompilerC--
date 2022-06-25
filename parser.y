/*
    Analyser Bison

*/
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyparse();

extern int yylineno;
extern int yyerror();


%}

%token EOL
%token TEST

%%

    test: TEST {printf("TEste!!!\n");}
    |TEST TEST {printf("Teste 2\n"); }
    ;

%%
