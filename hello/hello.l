%{
#include <stdio.h>
#include <stdlib.h>

#include "hello.tab.h"

// #define DEBUG_R
%}

%%
"hello" {
#ifdef DEBUG_R
    printf("Hello\n");
#endif

    return HELLO;
}

"world" {
#ifdef DEBUG_R
    printf("World\n");
#endif

    return WORLD;
}

"sun" {
#ifdef DEBUG_R
    printf("Sun\n");
#endif

    return SUN;
}

\"[^\"\n]+\" {
#ifdef DEBUG_R
    printf("String! Your input is \"%s\".\n", yytext);
#endif

    strncpy(yylval.string, yytext + 1, strlen(yytext) - 1);
    return STRING;
}

[0-9]+ {
#ifdef DEBUG_R
    printf("Number! Your input is %d.\n", yytext);
#endif

    yylval.number = atoi(yytext);
    return NUMBER;
}

[a-zA-Z][a-zA-Z0-9]* {
#ifdef DEBUG_R
    printf("Identifier! Your input is \"%s\".\n", yytext);
#endif

    strcpy(yylval.identifier, yytext);
    return IDENTIFIER;
}


[ \n\t]+ { /* Skip */ }
%%
