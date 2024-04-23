%option noyywrap yylineno
%{
#include <stdio.h>
#include <string.h>

#define select 1
#define from 2
#define create 3
#define alter 4
#define drop 5
#define delete 6
#define insert 7
#define update 8
#define where 9
#define on 10
#define in 11
#define join 12
#define outer 13
#define inner 14
#define like 15
#define not 16
#define LP 17
#define RP 18
#define table 19
#define add 20
#define column 21
#define null 22
#define integer 23
#define primary 24
#define key 25
#define varchar 26
#define number 27
#define decimal 28
#define comma 29
#define semi_colon 30
#define dot 31
#define ALL 32
#define greater 33
#define lesser 34
#define equal 35
#define set 36
#define colon 37
#define identifier 38








%}
%%
[ \t\n]+ 
SELECT      {return select;}
FROM        {return from;} 
CREATE      {return create;}
ALTER       {return alter;}
DROP        {return drop;}
DELETE      {return delete;}
INSERT      {return insert;}
UPDATE      {return update;}
WHERE       {return where;}
ON          {return on;}
IN          {return in;}
JOIN        {return join;}
OUTER       {return outer;}
INNTER      {return inner;}
LIKE        {return like;}   
NOT         {return not;}
\)          {return LP;}
\(          {return RP;}
TABLE       {return table;}
ADD         {return add;}
COLUMN      {return column;}
NULL         {return null;}
INT         {return integer;}
PRIMARY     {return primary;}
KEY          {return key;}
VARCHAR     {return varchar;}
[0-9]*     {return number;}
DECIMAL     {return decimal;}
,             {return comma;}
;             {return semi_colon;}
\.\             {return dot;}
\*\             {return ALL;}
\>\            {return greater;}
\<\          {return lesser;}
\=\            {return equal;}
SET            {return set;}
\'             {return colon;}
[A-Za-z_][0-9A-Za-z_]*    {return identifier;}
\\$         



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
                        case select:
                            fprintf(output,"Select, %s, %d\n",yytext,yylineno);
                            break;

                        case from:
                            fprintf(output,"From, %s, %d\n",yytext,yylineno);
                            break;

                        case create:
                            fprintf(output,"Create, %s,%d\n",yytext,yylineno);
                            break;

                        case alter:
                            fprintf(output,"Alter, %s,%d\n",yytext,yylineno);
                            break;

                        case drop:
                            fprintf(output,"Drop, %s,%d\n",yytext,yylineno);
                            break;

                        case delete:
                            fprintf(output,"Delete, %s,%d\n",yytext,yylineno);
                            break;

                        case insert:
                            fprintf(output,"Insert, %s,%d\n",yytext,yylineno);
                            break;

                        case update:
                            fprintf(output,"Update, %s,%d\n",yytext,yylineno);
                            break;
                            
                        case where:
                            fprintf(output,"Where, %s,%d\n",yytext,yylineno);
                            break;

                        case on:
                            fprintf(output,"On, %s,%d\n",yytext,yylineno);
                            break;

                        case in:
                            fprintf(output,"In, %s,%d\n",yytext,yylineno);
                            break;


                         case join:
                            fprintf(output,"Join, %s,%d\n",yytext,yylineno);
                            break;

                         case outer:
                            fprintf(output,"Outer, %s,%d\n",yytext,yylineno);
                            break;

                         case inner:
                            fprintf(output,"Inner, %s,%d\n",yytext,yylineno);
                            break;

                         case like:
                            fprintf(output,"Like, %s,%d\n",yytext,yylineno);
                            break;

                         case not:
                            fprintf(output,"Not, %s,%d\n",yytext,yylineno);
                            break;

                         case LP:
                            fprintf(output,"LP, %s,%d\n",yytext,yylineno);
                            break;

                         case RP:
                            fprintf(output,"RP,%s,%d\n",yytext,yylineno);
                            break;

                         case table:
                            fprintf(output,"table, %s, %d\n",yytext,yylineno);
                            break;

                        case add:
                            fprintf(output,"add, %s, %d\n",yytext,yylineno);
                            break;

                        case column:
                            fprintf(output,"column, %s,%d\n",yytext,yylineno);
                            break;

                        case null:
                            fprintf(output,"null, %s,%d\n",yytext,yylineno);
                            break;


                        case integer:
                            fprintf(output,"integer, %s,%d\n",yytext,yylineno);
                            break;
                            
                        case primary:
                            fprintf(output,"primary, %s,%d\n",yytext,yylineno);
                            break;

                        case key:
                            fprintf(output,"key, %s,%d\n",yytext,yylineno);
                            break;

                        case varchar:
                            fprintf(output,"varchar, %s,%d\n",yytext,yylineno);
                            break;

                         case number:
                            fprintf(output,"number, %s,%d\n",yytext,yylineno);
                            break;

                         case decimal:
                            fprintf(output,"decimal, %s,%d\n",yytext,yylineno);
                            break;

                         case comma:
                            fprintf(output,"Comma, %s,%d\n",yytext,yylineno);
                            break;

                         case semi_colon:
                            fprintf(output,"semi_colon, %s,%d\n",yytext,yylineno);
                            break;

                         case dot:
                            fprintf(output,"dot,%s,%d\n",yytext,yylineno);
                            break;
                            
                         case ALL:
                            fprintf(output,"ALL, %s,%d\n",yytext,yylineno);
                            break;

                        case greater:
                            fprintf(output,"greater, %s,%d\n",yytext,yylineno);
                            break;

                         case lesser:
                            fprintf(output,"lesser, %s,%d\n",yytext,yylineno);
                            break;

                         case equal:
                            fprintf(output,"equal, %s,%d\n",yytext,yylineno);
                            break;

                         case set:
                            fprintf(output,"set, %s,%d\n",yytext,yylineno);
                            break;

                         case colon:
                            fprintf(output,"colon, %s,%d\n",yytext,yylineno);
                            break;


                        case identifier:
                            fprintf(output,"Identifier, %s,%d\n",yytext,yylineno);
                            break;

                        
    }

    }


    return 0;
}

