CC = clang-18
CFLAGS = -O2 -Wall -Wno-implicit

LEX = lex
BISON = bison

# output directory (for .gitignore)
OUTPUT_DIR = build

# compile manual
MANUAL_OUTPUT = ${OUTPUT_DIR}/manual
MANUAL_SOURCES = manual.c

# compile lex
LEX_OUTPUT = ${OUTPUT_DIR}/lex.yy.c
LEX_SOURCES = hello.l

# compile bison
BISON_OUTPUT = ${OUTPUT_DIR}/hello.tab.c
BISON_OUTPUT_HEADER = ${OUTPUT_DIR}/hello.tab.h
BISON_SOURCES = hello.y

# compile compiler
COMPILER_OUTPUT = ${OUTPUT_DIR}/hello_compiler
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
	@echo "hello world hello sun" | $^ > _test_.c
	@${CC} _test_.c hello.c -o _test_
	@./_test_
	@rm -f _test_.c _test_

clean:
	rm -rf ${OUTPUT_DIR}