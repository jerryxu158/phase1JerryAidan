   /* cs152-miniL phase1 */
%{   
   /* write your C code here for definitions of variables and including headers */
   int col = 1, row = 1;
%}

   /* some common rules */
DIGIT    [0-9]
FUNC     "function"
ID       [a-zA-Z][a-zA-Z1-9_]*[a-zA-Z1-9]
SID      [a-zA-Z]
INVALN   [DIGIT]][a-zA-Z1-9_]*[a-zA-Z1-9]
INVALU   [a-zA-Z][a-zA-Z1-9_]*_
ASGN     :=
EQUATE   ==
LT       <[^[=>]]
GT       >[^=]
LB       "\["
RB       ]
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
NEWL     \n
TAB      \t
UNKNOWN  .

%%
   /* specific lexer rules in regex */
{DIGIT}+       {printf("NUMBER %s\n", yytext); row+= yyleng;}
"+"            {printf("ADD\n");}
"-"            {printf("SUB\n");}
"*"            {printf("MULT\n");}
"/"            {printf("DIV\n");}
{MOD}            {printf("MOD\n");}
{LP}           {printf("L_PAREN\n");}
{RP}           {printf("R_PAREN\n");}
{LB}           {printf("L_SQUARE_BRACKET\n");}
{RB}           {printf("R_SQUARE_BRACKET\n");}
{SEMI}         {printf("SEMICOLON\n");}
{COLN}         {printf("COLON\n");}
{comment}      {}   
{EQUATE}       {printf("EQ\n");}
{ASGN}         {printf("ASSIGNED\n");}
{LT}           {printf("LT\n");}
{GT}           {printf("GT\n");}
{LTE}          {printf("LTE\n");}
{GTE}          {printf("GTE\n");}
{NE}           {printf("NEQ\n");}
"array"        {printf("ARRAY\n");}
{FUNC}         {printf("FUNCTION\n");}
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
" "            {col++; col +=1;}
{ID}           {printf("IDENTIFIER %s\n", yytext); col += yyleng;}
{SID}          {printf("IDENTIFIER %s\n", yytext); col += yyleng;}
{NEWL}         {row++; col = 0;}
{TAB}          {col+=4;}
{UNKNOWN}      {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", row, col, yytext); exit(1);}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
   printf("%d", col);
}
