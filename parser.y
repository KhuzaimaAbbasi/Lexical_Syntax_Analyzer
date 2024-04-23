%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define YYSTYPE char *

extern int yylex();
extern int yylineno;
extern char *yytext;
extern FILE *yyin;



void yyerror(const char* message);

%}

%token SELECT DELETE INSERT UPDATE CREATE ALTER DROP WHERE FROM INTO VALUES ON IN JOIN OUTER INNER LIKE NOT ADD GT LT EQ ALL null INT DECIMAL VARCHAR PRIMARY KEY TABLE COLUMN SET LPAREN RPAREN COMMA SEMICOLON NUMBER IDENTIFIER

%%
query : select_statement SEMICOLON
      | delete_statement SEMICOLON
      | insert_statement SEMICOLON
      | update_statement SEMICOLON
      | create_statement SEMICOLON
      | alter_statement SEMICOLON
      | drop_statement SEMICOLON
      ;

select_statement : SELECT column_list FROM table_expression where_clause
                 ;

delete_statement : DELETE FROM IDENTIFIER where_clause
                 ;

insert_statement : INSERT INTO IDENTIFIER column_list VALUES value_list
                 ;

update_statement : UPDATE IDENTIFIER SET column_assignment_list where_clause
                 ;

create_statement : CREATE TABLE IDENTIFIER LPAREN column_definition_list RPAREN
                 ;

alter_statement : ALTER TABLE IDENTIFIER ADD column_definition
                ;

drop_statement : DROP TABLE IDENTIFIER
               ;

where_clause : WHERE condition
             | /* Empty */
             ;

table_expression : IDENTIFIER
                 | table_expression JOIN table_expression ON condition
                 ;

column_list : LPAREN identifier_list RPAREN
            | ALL
            ;

value_list : LPAREN literal_list RPAREN
           ;

column_assignment_list : column_assignment
                       | column_assignment_list COMMA column_assignment
                       ;

column_assignment : IDENTIFIER EQ literal
                  ;

column_definition_list : column_definition
                       | column_definition_list COMMA column_definition
                       ;

column_definition : IDENTIFIER data_type
                  ;

condition : IDENTIFIER operator literal
          ;

operator : EQ
         | GT
         | LT
         ;

data_type : INT
          | DECIMAL
          | VARCHAR
          ;

identifier_list : IDENTIFIER
                | identifier_list COMMA IDENTIFIER
                ;

literal_list : literal
             | literal_list COMMA literal
             ;

literal : NUMBER
        | null
        ;

%%

void yyerror(const char* message) {
    fprintf(stderr, "Error: %s at line %d for %s\n", message, yylineno, yytext);
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: ./parser <input_file>\n");
        return 1;
    }
    
    FILE* input_file = fopen(argv[1], "r");
    if (!input_file) {
        printf("Error opening input file.\n");
        return 1;
    }
    
    yyin = input_file;
    
    yyparse();
    
    fclose(input_file);
    
    return 0;
}
