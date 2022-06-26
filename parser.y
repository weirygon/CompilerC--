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
%union {

    int num;
    char* str;

}
%token <str> ID
%token <num> NUMBER


%token VOID CHAR INT FOR IF ELSE WHILE RETURN EXTERN



%token EOL
%token TEST

%start calclist
%%

    void:  void { printf("+++ %s \n", $2);}
    ;
/*
    prog: dcl ';'  EOL
    |  func EOL
    ;

    dcl:    type var_decl  
    |       type var_decl ',' var_decl      
    |	    EXTERN type ID '(' parm_types ')' 
    |       EXTERN type ID '(' parm_types ')' ',' ID '(' parm_types ')'
    ;

    var_decl:   //Empty Word
    |           ID'[' intcon ']'
    ;

    type:   CHAR
    |       INT
    ;

    parm_types: VOID
    |   type ID '[' ']'
    |   type ID '[' ']', type ID '[' ']'
    ;

    func:   type ID '(' parm_types ')''{' type var_decl';' stmt '}'
    |       type ID '(' parm_types ')''{' type var_decl',' var_decl';' stmt '}' 
    |       VOID ID '(' parm_types ')''{' type var_decl';' stmt '}'
    |       VOID ID '(' parm_types ')''{' type var_decl',' var_decl';' stmt '}'
    ;

    stmt:   IF '(' expr ')' stmt
    |       IF '(' expr ')' stmt ELSE stmt
    |       WHILE '(' expr ')' stmt
    |       FOR '(' assg ';' expr ';' assg ')' stmt
    |       RETURN expr ';'
    |       assg ';'
    |       ID '(' expr ')'';'
    |       ID '(' expr ',' expr ')'';'
    |       '{' stmt '}'
    |       ';'
    ;

    assg:   ID '[' expr ']'
    ;

    expr:   // Empty Word
    |       '-' expr
    |       '!' expr
    |       expr binop expr
    |       expr relop expr
    |       expr logical_op expr
    |       ID '(' expr ')'
    |       ID '(' expr ',' expr ')'
    |       ID '[' expr ']'
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
