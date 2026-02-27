/* Program to count the number of identifiers */
%{
	#include <stdio.h>
	int cnt = 0;
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* {cnt++;ECHO;printf("\n");}
[0-9][a-zA-z0-9]* {;}
. {;}
\n {;}
%%
int yywrap() {return 1;}
int main(int argc , char* argv[]){
	if(argc != 2){
		printf("Usage :./a.out in.txt");
		exit(0);
	}
	yyin = fopen(argv[1],"r");
	yylex();
	printf("The number of identifiers is: %d\n",cnt);
	return 0;
}

