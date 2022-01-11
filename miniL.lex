   /* cs152-miniL phase1 */
%{   
   /* write your C code here for definitions of variables and including headers */
%}

   /* some common rules */
DIGIT    [0-9]
ASGN     :=
EQUATE   ==
LT       <(?=^[=>])
GT       >(?=^=)
LTE      <=
GTE      >=
NE       <>
NOT      "not"

%%
   /* specific lexer rules in regex */
{DIGIT}+       {printf("NUMBER %s\n", yytext);}
"+"            {printf("ADD\n");numOps++;}
"-"            {printf("SUBTRACT\n");numOps++;}
"*"            {printf("MULTIPLY\n");numOps++;}
"/"            {printf("DIVIDE\n");numOps++;}
"("            {printf("LEFT\n"); numParan++;}
")"            {printf("RIGHT\n");numParan++;}
EQUATE         {printf("is equal to\n");}
ASGN           {printf("ASSIGNED\n");}
LT             {printf("is less than\n");}
GT             {printf("is greater than\n");}
LTE            {printf("is less than or equal to\n");}
GTE            {printf("is greater than or equal to\n");}
NOT            {printf("LOGICAL NOT\n");}
NE             {printf("not equal to\n");}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}
