%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    int number;
    char string[64];
    char identifier[256];
}

%token <number> NUMBER;
%token <string> STRING;
%token <identifier> IDENTIFIER;

%token HELLO_WORLD

%type <identifier> str;
%type <identifier> oper;

%%

prog: str {
    printf("#include <stdio.h>\n\n");
    printf("int main(int argc, char const *argv[])\n{\n\t%s\n\treturn 0;\n}", $1);
}

str: oper           { sprintf($$, "%s", $1); }
    | oper str      { sprintf($$, "%s\n\t%s", $1, $2); }
    ;

oper: HELLO_WORLD   { sprintf($$, "printf(\"Hello, World!\\n\");"); }
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
