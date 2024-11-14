# Variables
CC = gcc
LEX = flex
YACC = bison
LEX_FILE = lexer.l
YACC_FILE = parser.y
OUTPUT = graphlang
CFLAGS = -lfl

# Regla principal
all: $(OUTPUT)

# Regla para compilar el archivo de salida
$(OUTPUT): lex.yy.c parser.tab.c
	$(CC) parser.tab.c lex.yy.c -o $(OUTPUT) $(CFLAGS)

# Regla para generar el archivo de Flex
lex.yy.c: $(LEX_FILE) parser.tab.h
	$(LEX) $(LEX_FILE)

# Regla para generar el archivo de Bison
parser.tab.c parser.tab.h: $(YACC_FILE)
	$(YACC) -d $(YACC_FILE)

# Limpiar los archivos generados
clean:
	rm -f lex.yy.c parser.tab.c parser.tab.h $(OUTPUT)

# Limpiar todo excepto el ejecutable
clean_objs:
	rm -f lex.yy.c parser.tab.c parser.tab.h

# Ejecución del programa
run: $(OUTPUT)
	./$(OUTPUT)
