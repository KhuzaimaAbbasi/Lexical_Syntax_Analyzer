%option noyywrap yylineno
%{
#include <stdio.h>
#include <string.h>

#define DML 1
#define DDL 2
#define operator 3
#define where 4
#define Data_Type 5
#define Syntax 6
#define Keyword 7
#define Identifier 8
#define constraint 9
#define number 10








%}
%%
[ \t\n]+ 


SELECT      {return DML;} 
DELETE      {return DML;}
INSERT      {return DML;}
UPDATE      {return DML;}



CREATE      {return DDL;}
ALTER       {return DDL;}
DROP        {return DDL;}


WHERE       {return where;}


FROM        {return operator;}
ON          {return operator;}
IN          {return operator;}
JOIN        {return operator;}
OUTER       {return operator;}
INNER      {return operator;}
LIKE        {return operator;}   
NOT         {return operator;}
ADD         {return operator;}
\>\         {return operator;}
\<\         {return operator;}
\=\         {return operator;}
%            {return operator;}
\*\          {return operator;}


INT         {return Data_Type;}
DECIMAL     {return Data_Type;}
VARCHAR     {return Data_Type;}


PRIMARY     {return constraint;}
KEY          {return constraint;}



TABLE       {return Keyword;}
COLUMN      {return Keyword;}
NULL         {return Keyword;}
SET          {return Keyword;}





\)          {return Syntax;}
\(          {return Syntax;}
,           {return Syntax;}
;           {return Syntax;}
\.\          {return Syntax;}
\'\          {return Syntax;}




[0-9]*     {return number;}


^[A-Za-z_][0-9A-Za-z_]{0,63}$  {return Identifier}














%%
int main( int argc , char* argv[])

{

    if(argc=2)
    {
    yyin = fopen(argv[1], "r");

    }

    FILE *output;

    output=fopen("output.txt","w");
     
     int ret;
      
      int line_number=1;
    while(ret=yylex())

    {
    
            switch(ret){
                        case DML:
                            fprintf(output,"DML_Statement, %s, %d\n",yytext,yylineno);
                            break;


                        case DDL:
                            fprintf(output,"DDL_Statement, %s,%d\n",yytext,yylineno);
                            break;

                            
                        case where:
                            fprintf(output,"Where, %s,%d\n",yytext,yylineno);
                            break;

                        case operator:
                            fprintf(output,"Operator, %s,%d\n",yytext,yylineno);
                            break;
               
                         case Syntax:
                            fprintf(output,"Syntax, %s,%d\n",yytext,yylineno);
                            break;


                         case Keyword:
                            fprintf(output,"Keyword, %s, %d\n",yytext,yylineno);
                            break;


                  
                        case Data_Type:
                            fprintf(output,"Data Type, %s,%d\n",yytext,yylineno);
                            break;
                            
                        case constraint:
                            fprintf(output,"Constraint, %s,%d\n",yytext,yylineno);
                            break;

           
                         case number:
                            fprintf(output,"Number, %s,%d\n",yytext,yylineno);
                            break;


                         case Identifier:
                            fprintf(output,"Identifier, %s,%d\n",yytext,yylineno);
                            break;


                    
                        
           
    }

    }


    return 0;
}

