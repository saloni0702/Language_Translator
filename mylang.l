%{
#include<stdio.h>
#include<math.h>
#include "y.tab.h"
%}

%%
[0-9]+  {
		yylval.i=atoi(yytext);
		return NUMBER;
		}
[0-9]*\.[0-9]+ {
		yylval.f=(float)atof(yytext); 
		return FLOAT;
		}
what  {return what;}
will   {return will;}
be   {return be;}
the   {return the;}
amount  {return amount;}
when	{return when;}
deposite {return deposite;}
withdraw {return withdraw;}
total   {return total;}
is      {return is;}
"?"     {return *yytext;}
[\n]	{return yytext;}
[/t]	;
%%
int yywrap(){return 1;}