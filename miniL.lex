   /* cs152-miniL phase1 */
%{   
   /* write your C code here for definitions of variables and including headers */
   int col = 1, row = 1;
%}

   /* some common rules */
INVALN   [0-9]+[a-zA-Z_]+
DIGIT    [0-9]
NUM      [DIGIT]+
NEWL     \n
TAB      \t
INVALU   [a-zA-z][a-zA-Z0-9_]*_
SID      [a-zA-Z]
ID       [a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]
ASGN     :=
EQUATE   ==
LT       <[^[=>]]
GT       >[^=]
LB       "\["
RB       "]"
LP       "\("
RP       ")"
MOD      %
LTE      <=
GTE      >=
NE       <>
SEMI     ;
COLN     :
CMMA     ,
comment  ##.*
UNKNOWN  [^TAB NEWL comment CMMA COLN SEMI NE GTE LTE MOD RP LP RB LB GT LT EQUATE ASGN ID SID INVALU INVALN FUNC NUM]

%%
   /* specific lexer rules in regex */
"+"            {printf("ADD\n"); col++;}
"-"            {printf("SUB\n"); col++;}
"*"            {printf("MULT\n"); col++;}
"/"            {printf("DIV\n"); col++;}
{MOD}          {printf("MOD\n"); col++;}
{LP}           {printf("L_PAREN\n"); col++;}
{RP}           {printf("R_PAREN\n"); col++;}
{LB}           {printf("L_SQUARE_BRACKET\n"); col++;}
{RB}           {printf("R_SQUARE_BRACKET\n"); col++;}
{SEMI}         {printf("SEMICOLON\n"); col++;}
{COLN}         {printf("COLON\n"); col++;}
{comment}      {}   
{EQUATE}       {printf("EQ\n"); col++;}
{ASGN}         {printf("ASSIGNED\n"); col++;}
{LT}           {printf("LT\n"); col++;}
{GT}           {printf("GT\n"); col++;}
{LTE}          {printf("LTE\n"); col += 2;}
{GTE}          {printf("GTE\n"); col += 2;}
{NE}           {printf("NEQ\n"); col += 2;}
"array"        {printf("ARRAY\n"); col += 5;}
"function"         {printf("FUNCTION\n"); col += 8;}
"beginparams"  {printf("BEGIN_PARAMS\n"); col += 11;}
"endparams"    {printf("END_PARAMS\n"); col += 9;}
"beginlocals"  {printf("BEGIN_LOCALS\n"); col += 11;}
"endlocals"    {printf("END_LOCALS\n"); col += 9;}
"beginbody"    {printf("BEGIN_BODY\n"); col += 9;}
"endbody"      {printf("END_BODY\n"); col += 7;}
"integer"      {printf("INTEGER\n"); col += 7;}  
"of"           {printf("OF\n"); col += 2;}
"if"           {printf("IF\n"); col += 2;}
"then"         {printf("THEN\n"); col += 4;}
"endif"        {printf("ENDIF\n"); col += 5;}
"else"         {printf("ELSE\n"); col += 4;}
"while"        {printf("WHILE\n"); col += 5;}
"do"           {printf("DO\n"); col += 2;}
"beginloop"    {printf("BEGINLOOP\n"); col += 9;}
"endloop"      {printf("ENDLOOP\n"); col += 7;}
"continue"     {printf("CONTINUE\n"); col += 8;}
"break"        {printf("BREAK\n"); col += 5;}
"read"         {printf("READ\n"); col += 4;}
"write"        {printf("WRITE\n"); col += 5;}
"not"          {printf("NOT\n"); col += 3;}
"true"         {printf("TRUE\n"); col += 4;}
"false"        {printf("FALSE\n"); col += 5;}
"return"       {printf("RETURN\n"); col += 6;}
"for"          {printf("FOR\n"); col += 3;}
" "            {col++;}
{NEWL}         {row++; col = 0;}
{TAB}          {col += 4;}
{INVALN}       {printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", row, col, yytext); exit(1);}
{INVALU}       {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", row, col, yytext); exit(1);}
{ID}           {printf("IDENT %s\n", yytext); col += yyleng;}
{SID}          {printf("IDENT %s\n", yytext); col += yyleng;}
{DIGIT}+       {printf("NUMBER %s\n", yytext); col += yyleng;}

{UNKNOWN}      {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", row, col, yytext); exit(1);}


%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
   printf("%d", col);
}
