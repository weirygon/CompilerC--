%option noyywrap yylineno
%{
	#include <string.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include "sintatico.tab.h"
%}

int main(){
    printf("> ");
    return yyparse();
}