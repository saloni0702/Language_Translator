%{
#include<stdio.h> 
extern FILE *yyin;
float TOTALAMOUNT=3000;
%} 
%union{
int i;
float f;
}
%token <i> NUMBER <f> FLOAT
%token what will be the total amount deposite withdraw when is
%type <f> S E A B P Q
%%

S:what will be the total amount when the E {$$=$9;};

E:deposite A  {$$=$2;}
  |withdraw B  {$$=$2;};

A:amount is P {$$=$3;};
B:amount is Q {$$=$3;};

P:NUMBER '?' {$$=TOTALAMOUNT+$1;TOTALAMOUNT=$$;if(TOTALAMOUNT<500){printf("error \n");}else{printf("total amount is: %f \n",$$);};}

Q:NUMBER '?' {$$=TOTALAMOUNT-$1;TOTALAMOUNT=$$;if(TOTALAMOUNT<500){;printf("error.. balance should be greater than 500.. current balance is %f \n",(TOTALAMOUNT+$1));TOTALAMOUNT=TOTALAMOUNT+$1;}else{printf("total amount is: %f \n",$$);};}

%%
void yyerror(char *s){}
int main(int argc, char *argv[]) 
{
yyin=fopen(argv[1],"r");
int i;
for(i=1;i<=9;i++){
yyparse();
}
fclose(yyin);
return 0;
}