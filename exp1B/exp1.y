/* Program to recognize valid declaration statements */

%{
	#include <stdio.h>
	#include <stdlib.h>
	
%}
%token SP SC CM ID INT CHAR NL
%%
S : type SP list SC NL {printf("Valid\n"); exit(0);}
;
type : INT 
	 | CHAR ;
	 
list : list SP CM SP ID 
	 | list CM ID 
	 | ID;
%%
int yyerror(char *msg)
{
	printf("Invalid Declaration statement\n");
	exit(0);
}
int main(){
	printf("Enter the declaration statement:\n");
	yyparse();
}
