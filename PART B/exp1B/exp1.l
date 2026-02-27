%{
	#include "y.tab.h"
%}
%%
[ ] {return SP;}
[\n] {return NL;}
[;] {return SC;}
[,] {return CM;}
"int" {return INT;}
"char" {return CHAR;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
. {;}
%%
int yywrap() {return 1;}


