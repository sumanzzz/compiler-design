%{
	#include <stdio.h>
	int count = 0;
%}
%s COMMENT
%%
"//".* {count++;}
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {BEGIN 0; count++;}
<COMMENT>\n {count++;}
<COMMENT>. {;}
.|\n {fprintf(yyout,"%s",yytext);}
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
	printf("\nNo of Comment lines = %d\n",count);
}
