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

%token VOID FOR IF ELSE WHILE RETURN EXTERN

%token EOL
%token TEST

%start calclist
%%
   /* prog: dcl ';'  
    |  func 
    ;

    dcl:    type var_decl  
    |       type var_decl ',' var_decl
    |        
    |	[ extern ] type id '(' parm_types ')' { ',' id '(' parm_types ')' }        |	[ extern ] void id '(' parm_types ')' { ',' id '(' parm_types ')' }
    ;
    var_decl: id [ '[' intcon']'] */


    calclist: /*Empty Word*/ 
    
    | calclist test EOL {
        }
    | calclist error EOL { yyerror; printf(">_"); }
    ;


    test: ';'{printf("TEste!!!\n");}
    |TEST TEST {printf("Teste 2\n"); }
    ;
%%
