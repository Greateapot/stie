%{
#include <stdio.h>
#include <stdlib.h>

#include "test.tab.h"
%}

%%
"hello_world" {
    // printf("Hello, World!\n");
    return HELLO_WORLD;
}

\"[^\"\n]+\" {
    strncpy(yylval.string, yytext + 1, strlen(yytext) - 1);
    // printf("String! Your input is \"%s\".\n", yylval.string);
    return STRING;
}

[0-9]+ {
    yylval.number = atoi(yytext);
    // printf("Number! Your input is %d.\n", yylval.number);
    return NUMBER;
}

[a-zA-Z][a-zA-Z0-9]* {
    strcpy(yylval.identifier, yytext);
    // printf("Identifier! Your input is \"%s\".\n", yylval.identifier);
    return IDENTIFIER;
}

. {
    // printf("Syntax Error! Unexpected symbol \"%s\".\n", yytext);
    return YYerror;
}

[ \n\t]+ { /* Skip */ }
%%
