%{
#include "parser.tab.h"
%}

%%

"plot_bar"        { printf("Token: PLOT_BAR\n"); return PLOT_BAR; }
"plot_scatter"    { printf("Token: PLOT_SCATTER\n"); return PLOT_SCATTER; }
"plot_line"       { printf("Token: PLOT_LINE\n"); return PLOT_LINE; }
"data"            { printf("Token: DATA\n"); return DATA; }
[0-9]+            { printf("Token: NUMBER (%s)\n", yytext); yylval.num = atoi(yytext); return NUMBER; }
"["               { printf("Token: LBRACKET\n"); return LBRACKET; }
"]"               { printf("Token: RBRACKET\n"); return RBRACKET; }
","               { printf("Token: COMMA\n"); return COMMA; }
[ \t\n]           { /* Ignorar espacios en blanco */ }
.                 { printf("Token desconocido: %s\n", yytext); return yytext[0]; }

%%

int yywrap() {
    return 1;
}
