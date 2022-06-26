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

%token VOID CHAR INT FOR IF ELSE WHILE RETURN EXTERN

%token EOL
%token TEST

%start calclist
%%/*
    prog: dcl ';'  
    |  func 
    ;

    dcl:    type var_decl  
    |       type var_decl ',' var_decl      
    |	    EXTERN type id '(' parm_types ')' 
    |       EXTERN type id '(' parm_types ')' ',' id '(' parm_types ')'
    ;

    var_decl: id'[' intcon ']'
    ;
    type:   CHAR
    |       INT
    ;*/

    calclist: /*Empty Word*/ 
    
    | calclist test EOL {
        }
    | calclist error EOL { yyerror; printf(">_"); }
    ;


    test: ';'{printf("TEste!!!\n");}
    |TEST TEST {printf("Teste 2\n"); }
    ;
%%
