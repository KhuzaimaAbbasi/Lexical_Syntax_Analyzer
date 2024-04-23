typedef struct {
    char* name;
    char* data_type;
    // Add other properties as needed
} Column;

typedef struct {
    char* name;
    // Add other properties as needed
    Column** columns;
    int num_columns;
} Table;

Table** tables;
int num_tables = 0;



// Function to check if a table with the given name already exists
int tableExists(char* table_name) {
    for (int i = 0; i < num_tables; i++) {
        if (strcmp(tables[i]->name, table_name) == 0) {
            return 1;
        }
    }
    return 0;
}

// Function to add a new table to the list of tables
void addTable(char* table_name) {
    if (tableExists(table_name)) {
        printf("Error: Table '%s' already exists.\n", table_name);
        exit(1);
    }
    
    Table* table = malloc(sizeof(Table));
    table->name = strdup(table_name);
    // Initialize other properties as needed
    table->num_columns = 0;
    table->columns = NULL;
    
    tables = realloc(tables, (num_tables + 1) * sizeof(Table*));
    tables[num_tables] = table;
    num_tables++;
}

// Function to add a new column to the current table
void addColumn(char* column_name, char* data_type) {
    // Check if a column with the same name already exists in the current table
    for (int i = 0; i < tables[num_tables - 1]->num_columns; i++) {
        if (strcmp(tables[num_tables - 1]->columns[i]->name, column_name) == 0) {
            printf("Error: Column '%s' already exists in table '%s'.\n", column_name, tables[num_tables - 1]->name);
            exit(1);
        }
    }
    
    Column* column = malloc(sizeof(Column));
    column->name = strdup(column_name);
    column->data_type = strdup(data_type);
    // Initialize other properties as needed
    
    tables[num_tables - 1]->columns = realloc(tables[num_tables - 1]->columns, (tables[num_tables - 1]->num_columns + 1) * sizeof(Column*));
    tables[num_tables - 1]->columns[tables[num_tables - 1]->num_columns] = column;
    tables[num_tables - 1]->num_columns++;
}

// Function to perform semantic analysis for the CREATE statement
void analyzeCreateStatement(char* table_name) {
    addTable(table_name);
    // Additional semantic analysis for CREATE statement if needed
}

// Function to perform semantic analysis for the INSERT statement
void analyzeInsertStatement(char* table_name) {
    if (!tableExists(table_name)) {
        printf("Error: Table '%s' does not exist.\n", table_name);
        exit(1);
    }
    // Additional semantic analysis for INSERT statement if needed
}

// Function to perform semantic analysis for the SELECT statement
void analyzeSelectStatement(char* table_name) {
    if (!tableExists(table_name)) {
        printf("Error: Table '%s' does not exist.\n", table_name);
        exit(1);
    }
    // Additional semantic analysis for SELECT statement if needed
}

// Function to perform semantic analysis for other statements and expressions
// Implement as needed based on the requirements of your specific language and parser
// You can use similar approaches to validate other statements and expressions



select_statement : SELECT column_list FROM table_expression where_clause
                 {
                     analyzeSelectStatement($3);
                 }
                 ;

insert_statement : INSERT INTO IDENTIFIER column_list VALUES value_list
                 {
                     analyzeInsertStatement($3);
                 }
                 ;

create_statement : CREATE TABLE IDENTIFIER LPAREN column_definition_list RPAREN
                 {
                     analyzeCreateStatement($3);
                 }
                 ;

// Implement similar updates for other statements and expressions
