   /* cs152-miniL phase1 */
%{   
   /* write your C code here for definitions of variables and including headers */
   int Col = 1, Row = 1;
%}

   /* some common rules */
DIGIT    [0-9]
ASGN     :=
EQUATE   ==
LT       <[^[=>]]
GT       >[^=]
LTE      <=
GTE      >=
NE       <>
SEMI     ;
COLN     :
NOT      "not"[\s]
OF       "of"\s
IF       "if"[\s]
FUNC     "function"[\s]
BEGINP   "beginparams"[\s]
ENDP     "endparams"[\s]
beginL   "beginlocals"[\s]
endL     "endlocals"[\s]
beginB   "beginbody"[\s]
endB     "endbody"[\s]
int      "integer"[\s]
ret      "return"[\s]
arr      array[DIGIT*]
ID       [a-zA-z][a-zA-z1-9_]*[a-zA-z1-9]/* letter followed by digits,letters or _ and ends in a digit or a letter*/
comment  ##.*\n

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
{EQUATE}       {printf("EQ\n");}
{ASGN}         {printf("ASSIGNED\n");}
{LT}           {printf("LT\n");}
{GT}           {printf("GT\n");}
{LTE}          {printf("LTE\n");}
{GTE}          {printf("GTE\n");}
{NOT}          {printf("NOT\n");}
{NE}           {printf("NEQ\n");}
FUNC         {printf("FUNCTION\n");}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
   printf("%d", Col);
}
