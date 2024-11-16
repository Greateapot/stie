CC = clang-18
CFLAGS = -O2 -Wall -Wno-implicit -Wno-return-type -Wno-unused-function

LEX = lex
BISON = bison

# output directory (for .gitignore)
OUTPUT_DIR = build

# compile manual
MANUAL_OUTPUT = ${OUTPUT_DIR}/manual
MANUAL_SOURCES = manual.c

# compile lex
LEX_OUTPUT = ${OUTPUT_DIR}/lex.yy.c
LEX_SOURCES = stie.l

# compile bison
BISON_OUTPUT = ${OUTPUT_DIR}/stie.tab.c
BISON_OUTPUT_HEADER = ${OUTPUT_DIR}/stie.tab.h
BISON_SOURCES = stie.y

# compile compiler
COMPILER_OUTPUT = ${OUTPUT_DIR}/stie_compiler
COMPILER_SOURCES = ${LEX_OUTPUT} ${BISON_OUTPUT}

.PHONY: all lex test clean

all: clean lex

lex: ${BISON_OUTPUT} ${LEX_OUTPUT} ${COMPILER_OUTPUT}

${MANUAL_OUTPUT}: ${MANUAL_SOURCES}
	@mkdir -p ${OUTPUT_DIR}
	${CC} $^ -o $@ ${CFLAGS}

${BISON_OUTPUT}: ${BISON_SOURCES}
	@mkdir -p ${OUTPUT_DIR}
	${BISON} -d -o $@ $^

${LEX_OUTPUT}: ${LEX_SOURCES}
	@mkdir -p ${OUTPUT_DIR}
	${LEX} -o $@ $^

${COMPILER_OUTPUT}: ${COMPILER_SOURCES}
	@${CC} $^ -lfl -o $@ ${CFLAGS}
	@rm -f ${COMPILER_SOURCES} ${BISON_OUTPUT_HEADER}

test: ${COMPILER_OUTPUT}
	@$^ < test.txt > test.c
	@${CC} test.c stie.c -o test
	@./test
	@rm -f test.c test

clean:
	rm -rf ${OUTPUT_DIR}