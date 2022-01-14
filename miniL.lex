   /* cs152-miniL phase1 */
%{   
   /* write your C code here for definitions of variables and including headers */
   int col = 1, row = 1;
%}

   /* some common rules */
DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z1-9_]*[a-zA-Z1-9]
SID      [a-zA-Z]
ASGN     :=
EQUATE   ==
LT       <[^[=>]]
GT       >[^=]
LTE      <=
GTE      >=
NE       <>
SEMI     ;
COLN     :
CMMA     ,
comment  ##.*\n
NEWL     \n
TAB      \t


%%
   /* specific lexer rules in regex */
{DIGIT}+       {printf("NUMBER %s\n", yytext);}
"+"            {printf("ADD\n");}
"-"            {printf("SUB\n");}
"*"            {printf("MULT\n");}
"/"            {printf("DIV\n");}
"%"            {printf("MOD\n");}
"("            {printf("L_PAREN\n");}
")"            {printf("R_PAREN\n");}
"["            {printf("L_SQUARE_BRACKET\n");}
"]"            {printf("R_SQUARE_BRACKET\n");}
";"            {printf("SEMICOLON\n");}
":"            {printf("COLON\n");}

{EQUATE}       {printf("EQ\n");}
{ASGN}         {printf("ASSIGNED\n");}
{LT}           {printf("LT\n");}
{GT}           {printf("GT\n");}
{LTE}          {printf("LTE\n");}
{GTE}          {printf("GTE\n");}
{NE}           {printf("NEQ\n");}
"array"        {printf("ARRAY\n");}
"function"     {printf("FUNCTION\n");}
"beginparams"  {printf("BEGINPARAMS\n");}
"endparams"    {printf("ENDPARAMS\n");}
"beginlocals"  {printf("BEGINLOCALS\n");}
"endlocals"    {printf("ENDLOCALS\n");}
"beginbody"    {printf("BEGINBODY\n");}
"endbody"      {printf("ENDBODY\n");}
"integer"      {printf("INTEGER\n");}  
"of"           {printf("OF\n");}
"if"           {printf("IF\n");}
"then"         {printf("THEN\n");}
"endif"        {printf("ENDIF\n");}
"else"         {printf("ELSE\n");}
"while"        {printf("WHILE\n");}
"do"           {printf("DO\n");}
"beginloop"    {printf("BEGINLOOP\n");}
"endloop"      {printf("ENDLOOP\n");}
"continue"     {printf("CONTINUE\n");}
"break"        {printf("BREAK\n");}
"read"         {printf("READ\n");}
"write"        {printf("WRITE\n");}
"not"          {printf("NOT\n");}
"true"         {printf("TRUE\n");}
"false"        {printf("FALSE\n");}
"return"       {printf("RETURN\n");}
"for"          {printf("FOR\n");}
" "            {col++;}
{ID}           {printf("IDENTIFIER %s\n", yytext);}
{SID}          {printf("IDENTIFIER %s\n", yytext);}
{NEWL}         {row++; col = 0;}
{TAB}          {col+=4;}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
   printf("%d", col);
}
