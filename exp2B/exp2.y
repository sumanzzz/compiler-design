/* Program to recognize nested if control statements and display the levels of nesting */
/*
	if(a > b){s1}
	if(a > b){if(b>c){s1}}
*/
%{
	#include <stdio.h>
	#include <stdlib.h>
	int count = 0;
%}
%token IF RELOP S ID NUMBER NL 
%% 
stmt : if_stmt NL {printf("It is valid IF Statement.\nNumber of nested IF statements = %d\n",count);exit(0);} ;
;
if_stmt : IF '(' condition ')' '{'if_stmt'}' {count++;}
		| S
		;
condition : x RELOP x
		;
x : ID 
  | NUMBER
  ;
%%
int yyerror(char *msg)
{
	printf("Invalid IF statement\n");
	exit(0);
}
int main(){
	printf("Enter the statement:\n");
	yyparse();
}

