%{
#include <stdio.h>
#include <math.h>
int yylex (void);
void yyerror (char const *);
%}
%define api.value.type {double}
%token NUM
%%
input:
%empty
| input line
;
line:
'\n'
| exp '\n'      { printf ("%.10g\n", $1); }
;
exp:
NUM           { $$ = $1;           }
| exp exp '+'   { $$ = $1 + $2;      }
| exp exp '-'   { $$ = $1 - $2;      }
| exp exp '*'   { $$ = $1 * $2;      }
| exp exp '/'   { $$ = $1 / $2;      }
| exp exp '^'   { $$ = pow ($1, $2); }  /* Exponentiation */
| exp 'n'       { $$ = -$1;          }  /* Unary minus    */
;
%%
void yyerror(char const *s){
	fprintf (stderr, "%s\n", s);
}
int main(void){
	return yyparse();
}
