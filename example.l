%{
	/*incluir librerias*/
	#include <stdio.h>
	FILE *fp;
%}
%%
[0-9]+    { fprintf( fp,"<span class='number'> [%s] </span>", yytext); }


auto|
break|case|for|if|switch			{ count(); return(CASE); }
char|double|float|int|flong|short|signed|unsigned {fprintf( fp,"<span class='dato'> [%s] </span>", yytext);}
"const"			{ count(); return(CONST); }
"default"		{ count(); return(DEFAULT); }
do|continue|else

"enum"			{ count(); return(ENUM); }
"extern"		{ count(); return(EXTERN); }
"for"			{ count(); return(FOR); }
"goto"			{ count(); return(GOTO); }
"if"			{ count(); return(IF); }
"register"		{ count(); return(REGISTER); }
"return"		{ count(); return(RETURN); }
"sizeof"		{ count(); return(SIZEOF); }
"static"		{ count(); return(STATIC); }
"struct"		{ count(); return(STRUCT); }
"switch"		{ count(); return(SWITCH); }
"typedef"		{ count(); return(TYPEDEF); }
"union"			{ count(); return(UNION); }
"void"			{ count(); return(VOID); }
"volatile"		{ count(); return(VOLATILE); }
"while"			{ count(); return(WHILE); }

int|char|float|double|long
%%

int main( int argc, char **argv ){
	++argv, --argc;  /* skip over program name */
	if ( argc > 0 )
		yyin = fopen( argv[0], "r" );
	else
		yyin = stdin;

	fp=fopen("a.html","w");
	if(fp!=NULL){
		fprintf(fp,"<html><head><title>Flex</title><link rel='stylesheet' href='ejemplo.css'</link></head><body>");
		yylex();
		fprintf(fp,"</body></html>");
		fclose(fp);
	}
        fclose(fp);
	}
