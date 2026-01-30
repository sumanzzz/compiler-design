%{
	#include <stdio.h>
	int scount = 0;
	int pcount = 0;
%}
%%
"scanf" {scount++;fprintf(yyout,"%s","readf");}
"printf" {pcount++;fprintf(yyout,"%s","writef");}
. {fprintf(yyout,"%s",yytext);}
%%
int yywrap() {return 1;}

void main(int argc , char* argv[]){
	if(argc != 3){
		printf("Usage ./a.out, int.txt ,out.c");
		exit(0);
	}
	yyin = fopen(argv[1],"r");
	yyout = fopen(argv[2],"w");
	yylex();
	printf("\nNo of scanf statements = %d\nNo of printf statements = %d\n ",scount,pcount);
}


