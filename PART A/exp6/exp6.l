%{
	#include <stdio.h>
	#include <string.h>
	int noprt = 0 , nopnd = 0;
	int valid = 1 , top = -1;
	int i = 0 , j = 0 ;
	char opnd[10][10];
	char oprt[10][2];
	char a[100];
%}
%%
"(" {a[++top]='(';}
"[" {a[++top]='[';}
"{" {a[++top]='{';}
")" {	if(a[top] != '('){
			valid = 0;return 0;
		}
		else top--;
	}
	
"]" {	if(a[top] != '['){
			valid = 0;return 0;
		}
		else top--;
	}
"}" {	if(a[top] != '{'){
			valid = 0;return 0;
		}
		else top--;
	}
"+"|"-"|"*"|"/" {noprt++;strcpy(oprt[i++],yytext);}

[0-9]+|[a-zA-Z][a-zA-Z0-9]* {nopnd++;strcpy(opnd[j++],yytext);}
%%
int yywrap() {return 1;}
int main(){
	printf("Enter the expression:");
	yylex();
	if(valid == 1 && nopnd - noprt == 1 && top == -1){
		printf("It is a valid Expression:\n");
		printf("number of operands: %d\n",nopnd);
		printf("The operands are:\n");
		for(int k = 0;k > i ;k++){
			printf("%s\n",opnd[k]);
		}
		printf("number of operators: %d\n",noprt);
		printf("The operators are:\n");
		for(int k = 0;k > i ;k++){
			printf("%s\n",oprt[k]);
		}
	}
	else{
		printf("Not a valid expression !\n");
	}
	return 0;
	
	
} 	

