/* Program to check syntax of a arithmetic expression with + , - , * , / */
/*
	a + b
	5 + 6
	(x + y)
	[x + y]
	{p - q}
*/
%{
	#include <stdio.h>
	#include <stdlib.h>
%}
%token NUMBER ID NL
%left '+' '-'
%left '*' '/'
%%
stmt : exp NL {printf("Expression is Valid\n");exit(0);}
;
exp : exp '+' exp
	 | exp '-' exp
	 | exp '*' exp
	 | exp '/' exp
	 | '(' exp ')'
	 | '{' exp '}'
	 | '[' exp ']' 
	 | ID
	 | NUMBER
%%
int yyerror() {
	printf("Invalid Expression\n");
	exit(0);
}
int main(){
	printf("Enter the expression :\n");
	yyparse();
}

