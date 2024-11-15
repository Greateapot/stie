%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    int number;
    char string[64];
    char identifier[1024];
}

%token <number> NUMBER;
%token <string> STRING;
%token <identifier> IDENTIFIER;

%token HELLO WORLD SUN;

%type <identifier> expression operation helloValue;

%%

program: expression {
    printf("#include <stdio.h>\n#include \"hello.h\"\n\n"); /* headers */
    printf("int main(int argc, char const *argv[])\n{\n\t%s\n\treturn 0;\n}", $1); /* entrypoint */
}

expression: operation       { sprintf($$, "%s", $1); } /* singleline */
    | operation expression  { sprintf($$, "%s\n\t%s", $1, $2); }  /* multiline */
    ;

operation: HELLO helloValue { sprintf($$, "say_hello_to(%s);", $2); }

helloValue: WORLD   { sprintf($$, "HelloWorld"); }
    | SUN           { sprintf($$, "HelloSun"); }
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
