%{
#include <stdio.h>
%}

%union {
    int number;
    char identifier[1024];
}

%token <number> NUMBER;
%token <identifier> IDENTIFIER;

%token PREPARE_CUP ADD_WATER BREW_TEA;
%token ADD_SUGAR ADD_HONEY ADD_MILK;
%token ADD_LEMON SERVE EMPTY_CUP;

%token CUP_SIZE_SMALL CUP_SIZE_MEDIUM CUP_SIZE_LARGE;
%token TEA_TYPE_BLACK TEA_TYPE_GREEN TEA_TYPE_PINK;

%type <identifier> str oper tea_size tea_type;

%%

program: str {
    printf("#include \"stie.h\"\n\n"); /* headers */
    printf("int main(int argc, char const *argv[])\n{\n\t%s\n\treturn 0;\n}\n", $1); /* entrypoint */
}

str: oper       { sprintf($$, "%s", $1); } /* singleline */
    | oper str  { sprintf($$, "%s\n\t%s", $1, $2); }  /* multiline */
    ;

oper: PREPARE_CUP IDENTIFIER tea_size       { sprintf($$, "cup_t *%s = prepare_cup(%s);", $2, $3); }
    | ADD_WATER IDENTIFIER NUMBER           { sprintf($$, "add_water(%s, %d);", $2, $3); }
    | BREW_TEA IDENTIFIER tea_type          { sprintf($$, "brew_tea(%s, %s);", $2, $3); }
    | ADD_SUGAR IDENTIFIER NUMBER           { sprintf($$, "add_sugar(%s, %d);", $2, $3); }
    | ADD_HONEY IDENTIFIER NUMBER           { sprintf($$, "add_honey(%s, %d);", $2, $3); }
    | ADD_MILK IDENTIFIER  NUMBER           { sprintf($$, "add_milk(%s, %d);", $2, $3); }
    | ADD_LEMON IDENTIFIER NUMBER           { sprintf($$, "add_lemon(%s, %d);", $2, $3); }
    | SERVE IDENTIFIER                      { sprintf($$, "serve(%s);", $2); }
    | EMPTY_CUP IDENTIFIER                  { sprintf($$, "empty_cup(%s);", $2); }
    ;

tea_size: CUP_SIZE_SMALL    { sprintf($$, "CUP_SIZE_SMALL"); }
    | CUP_SIZE_MEDIUM       { sprintf($$, "CUP_SIZE_MEDIUM"); }
    | CUP_SIZE_LARGE        { sprintf($$, "CUP_SIZE_LARGE"); }
    ;

tea_type: TEA_TYPE_BLACK    { sprintf($$, "TEA_TYPE_BLACK"); }
    | TEA_TYPE_GREEN        { sprintf($$, "TEA_TYPE_GREEN"); }
    | TEA_TYPE_PINK         { sprintf($$, "TEA_TYPE_PINK"); }
    ;
%%

yyerror(char* s)
{
    printf("Error: %s.\n", s);
}

int main(int argc, char *argv[])
{
    yyparse();
    return 0;
}
