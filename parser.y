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

%token VOID FOR IF WHILE RETURN

%token EOL
%token TEST

%start calclist
%%

    calclist: /*Empty Word*/ 
    
    | calclist test EOL {
        }
    | calclist error EOL { yyerror; printf(">_"); }
    ;


    test: ';'{printf("TEste!!!\n");}
    |TEST TEST {printf("Teste 2\n"); }
    ;
%%
