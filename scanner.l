%option noyywrap yylineno
%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"

#define SELECT 0
#define DELETE 0
#define INSERT 0
#define UPDATE 0


#define CREATE 0
#define ALTER 0
#define DROP 0

#define where 0

#define FROM 0
#define INTO 0
#define VALUES 0
#define ON 0
#define IN 0
#define JOIN 0
#define OUTER 0
#define INNER 0
#define LIKE 0
#define NOT 0
#define ADD 0
#define GT 0
#define LT 0
#define EQ 0
#define ALL 0

#define null 0

#define INT 0
#define DECIMAL 0
#define VARCHAR 0

#define constraint 0

#define TABLE 0
#define COLUMN 0

#define SET 0

#define LPAREN 0
#define RPAREN 0
#define COMMA 0
#define SEMICOLON 0

#define NUMBER 0
#define IDENTIFIER 0

%}

%%

[ \t\n]+

SELECT      {return SELECT;} 
DELETE      {return DELETE;}
INSERT      {return INSERT;}
UPDATE      {return UPDATE;}


CREATE      {return CREATE;}
ALTER       {return ALTER;}
DROP        {return DROP;}

WHERE       {return where;}

FROM        {return FROM;}
INTO        {return INTO;}
VALUES      {return VALUES;}
ON          {return ON;}
IN          {return IN;}
JOIN        {return JOIN;}
OUTER       {return OUTER;}
INNER       {return INNER;}
LIKE        {return LIKE;}   
NOT         {return NOT;}
ADD         {return ADD;}
\>\         {return GT;}
\<\         {return LT;}
\=\         {return EQ;}
\*\         {return ALL;}

NULL        {return null;}

INT         {return INT;}
DECIMAL     {return DECIMAL;}
VARCHAR     {return VARCHAR;}

"PRIMARY KEY"     {return constraint;}

TABLE       {return TABLE;}
COLUMN      {return COLUMN;}

SET         {return SET;}

\)          {return LPAREN;}
\(          {return RPAREN;}
,           {return COMMA;}
;           {return SEMICOLON;}

--.*        /* Ignore SQL comments */
[0-9]+      {return NUMBER;}

[A-Za-z_][0-9A-Za-z_]* {return IDENTIFIER;}

\\$         { /* Ignore line continuation */ }
.           { /* Ignore unrecognized characters */ }
%%

int custom_yywrap() {
    return 1; // Indicate end of input
}
