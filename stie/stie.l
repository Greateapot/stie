%{
#include <stdio.h>
#include <stdlib.h>

#include "stie.tab.h"
%}

%%
"prepare_cup" { return PREPARE_CUP; }
"add_water" { return ADD_WATER; }
"brew_tea" { return BREW_TEA; }
"add_sugar" { return ADD_SUGAR; }
"add_honey" { return ADD_HONEY; }
"add_milk" { return ADD_MILK; }
"add_lemon" { return ADD_LEMON; }
"serve" { return SERVE; }
"empty_cup" { return EMPTY_CUP; }

"small" { return CUP_SIZE_SMALL; }
"medium" { return CUP_SIZE_MEDIUM; }
"large" { return CUP_SIZE_LARGE; }

"black" { return TEA_TYPE_BLACK; }
"green" { return TEA_TYPE_GREEN; }
"pink" { return TEA_TYPE_PINK; }


[0-9]+ {
    yylval.number = atoi(yytext);
    return NUMBER;
}

[a-zA-Z][a-zA-Z0-9]* {
    strcpy(yylval.identifier, yytext);
    return IDENTIFIER;
}

[ \n\t]+ { /* Skip */ }
%%