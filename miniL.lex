   /* cs152-miniL phase1 */
%{   
   /* write your C code here for definitions of variables and including headers */
%}

   /* some common rules */
DIGIT    [0-9]
LETR     [a-zA-Z]
ASGN     :=
EQUATE   ==
LT       <(?![=>])
GT       >(?!=)
LTE      <=
GTE      >=
NE       <>
SEMI     ;
NOT      "not"(?=\s)
IF       "if"(?=\s)
FUNC     "function"(?=\s)
BEGINP   "beginparams"(?=\s)
ENDP     "endparams"(?=\s)
beginL   "beginlocals"(?=\s)
endL     "endlocals"(?=\s)
beginB   "beginbody"(?=\s)
endB     "endbody"(?=\s)
int      "integer"(?=\s)
arr      "array"[DIGIT*]
comment  ##.*\n

IDEN     LETR(LETR*_*DIGIT*)+[LETR DIGIT](?=^_)

%%
   /* specific lexer rules in regex */
{DIGIT}+       {printf("NUMBER %s\n", yytext);}
"+"            {printf("ADD\n");}
"-"            {printf("SUB\n");}
"*"            {printf("MULT\n");}
"/"            {printf("DIV\n");}
"%"            {printf("MOD\n");}
"("            {printf("LEFT\n");}
")"            {printf("RIGHT\n");}
EQUATE         {printf("EQ\n");}
ASGN           {printf("ASSIGNED\n");}
LT             {printf("LT\n");}
GT             {printf("GT\n");}
LTE            {printf("LTE\n");}
GTE            {printf("GTE\n");}
NOT            {printf("NOT\n");}
NE             {printf("NEQ\n");}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}
