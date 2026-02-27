%{
	#include <stdio.h>
	int v = 0;
	int c = 0;
	int spaces = 0;
	int o = 0;
%}
%%
[aeiouAEIOU] {v++;}
[A-Za-z] {c++;}
[ ] {spaces++;}
. {o++;}
%%
int yywrap() {return 1;}
int main(){
	printf("Enter the input:");
	yylex();
	printf("Total number of vowels: %d\n",v);
	printf("Total number of consonants: %d\n",c);
	printf("Total number of spaces: %d\n",spaces);
	printf("other characters: %d\n",o);
	
} 
