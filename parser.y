%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void plot_bar(int *data, int size);
void plot_scatter(int *data, int size);
void plot_line(int *data, int size); 
void yyerror(const char *s); 
#define YYDEBUG 1 
%}

%union {
    int num;
    int *arr;
}

%token PLOT_BAR PLOT_SCATTER PLOT_LINE DATA
%token <num> NUMBER
%token LBRACKET RBRACKET COMMA
%type <arr> data_list data_items

%%

program:
    statement { printf("Program processed with a single statement.\n"); }
    | program statement { printf("Program processed with multiple statements.\n"); }
    ;

statement:
    DATA data_list { printf("Statement 'data' recognized.\nData captured.\n"); }
    | PLOT_BAR data_list { printf("Statement 'plot_bar' recognized.\nGenerating bar plot...\n"); plot_bar($2, $2[0]); }
    | PLOT_SCATTER data_list { printf("Statement 'plot_scatter' recognized.\nGenerating scatter plot...\n"); plot_scatter($2, $2[0]); }
    | PLOT_LINE data_list { printf("Statement 'plot_line' recognized.\nGenerating line plot...\n"); plot_line($2, $2[0]); }
    ;

data_list:
    LBRACKET data_items RBRACKET { printf("Data list recognized.\n"); $$ = $2; }
    | LBRACKET RBRACKET { $$ = malloc(sizeof(int)); $$[0] = 0; printf("Empty data list recognized.\n"); }
    ;

data_items:
    NUMBER {
        $$ = malloc(sizeof(int) * 2);
        $$[0] = 1;
        $$[1] = $1;
        printf("Single number recognized: %d\n", $1);
    }
    | data_items COMMA NUMBER {
        $1[0]++;
        $1 = realloc($1, sizeof(int) * ($1[0] + 1));
        $1[$1[0]] = $3;
        $$ = $1;
        printf("Number appended: %d\n", $3);
    }
    ;

%%

void plot_bar(int *data, int size) {
    FILE *pipe = popen("gnuplot -persistent", "w");
    fprintf(pipe, "set style data histograms\n");
    fprintf(pipe, "set style fill solid\n");
    fprintf(pipe, "plot '-' using 2:xtic(1) title 'Bar Chart'\n");
    for (int i = 1; i <= size; i++) {
        fprintf(pipe, "%d %d\n", i, data[i]);
    }
    fprintf(pipe, "e\n");
    pclose(pipe);
    free(data);
}

void plot_scatter(int *data, int size) {
    FILE *pipe = popen("gnuplot -persistent", "w");
    fprintf(pipe, "set title 'Scatter Plot'\n");
    fprintf(pipe, "plot '-' with points pointtype 7\n");
    for (int i = 1; i <= size; i++) {
        fprintf(pipe, "%d %d\n", i, data[i]);
    }
    fprintf(pipe, "e\n");
    pclose(pipe);
    free(data);
}

void plot_line(int *data, int size) {
    FILE *pipe = popen("gnuplot -persistent", "w");
    fprintf(pipe, "set title 'Line Plot'\n");
    fprintf(pipe, "plot '-' with lines\n");
    for (int i = 1; i <= size; i++) {
        fprintf(pipe, "%d %d\n", i, data[i]);
    }
    fprintf(pipe, "e\n");
    pclose(pipe);
    free(data);
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yydebug = 1; 
    yyparse();
    return 0;
}
