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
%%
/*
    prog: dcl ';'  
    |  func 
    ;

    dcl:    type var_decl  
    |       type var_decl ',' var_decl      
    |	    EXTERN type id '(' parm_types ')' 
    |       EXTERN type id '(' parm_types ')' ',' id '(' parm_types ')'
    ;

    var_decl:   //Empty Word
    |           id'[' intcon ']'
    ;

    type:   CHAR
    |       INT
    ;

    parm_types: VOID
    |   type id '[' ']'
    |   type id '[' ']', type id '[' ']'
    ;

    func:   type id '(' parm_types ')''{' type var_decl';' stmt '}'
    |       type id '(' parm_types ')''{' type var_decl',' var_decl';' stmt '}' 
    |       VOID id '(' parm_types ')''{' type var_decl';' stmt '}'
    |       VOID id '(' parm_types ')''{' type var_decl',' var_decl';' stmt '}'
    ;

    stmt:   IF '(' expr ')' stmt
    |       IF '(' expr ')' stmt ELSE stmt
    |       WHILE '(' expr ')' stmt
    |       FOR '(' assg ';' expr ';' assg ')' stmt
    |       RETURN expr ';'
    |       assg ';'
    |       id '(' expr ')'';'
    |       id '(' expr ',' expr ')'';'
    |       '{' stmt '}'
    |       ';'
    ;

    assg:   id '[' expr ']'
    ;

    expr:   // Empty Word
    |       '-' expr
    |       '!' expr
    |       expr binop expr
    |       expr relop expr
    |       expr logical_op expr
    |       id '(' expr ')'
    |       id '(' expr ',' expr ')'
    |       id '[' expr ']'
    |       '(' expr ')'
    |       intcon
    |       charcon
    |       stringcon
    ;

    binop:  '+'
    |       '-'
    |       '*'
    |       '/'
    ;

    relop:  '=='
    |       '!='
    |       '<='
    |       '<'
    |       '>='
    |       '>'
    ;

    logical_op: '&&'
    |           '||'
    ;
*/
    calclist: /*Empty Word*/ 
    
    | calclist test EOL {
        }
    | calclist error EOL { yyerror; printf(">_"); }
    ;


    test: ';'{printf("TEste!!!\n");}
    |TEST TEST {printf("Teste 2\n"); }
    ;
%%
