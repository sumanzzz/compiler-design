%{
	#include <stdio.h>
	int posInt = 0 , negInt = 0 , posFrac = 0 , negFrac = 0 ;
%}
%%
[-][0-9]+ {negInt++;}
[+]?[0-9]+ {posInt++;}
[+]?[0-9]*\.[0-9]+ {posFrac++;}
[-][0-9]*\.[0-9]+ {negFrac++;}
%%

int yywrap()
{return 1;}

void main(int argc , char* argv[]){
	if(argc != 2){
		printf("Usage :./a.out in.txt");
		exit(0);
	}
	yyin = fopen(argv[1],"r");
	yylex();
	printf("\nNumber of positive integers : %d\nNumber of Negative integers : %d\nNumber of Positive Fractions : %d\nNumber of Negative Fractions : %d\n",posInt, negInt , posFrac , negFrac);
}
 
