CC = clang-18
CFLAGS = -O2 -Wall -Wextra -Wno-implicit

LEX = lex
BISON = bison

# output directory (for .gitignore)
OUTPUT_DIR = build

# compile manual
MANUAL_OUTPUT = ${OUTPUT_DIR}/manual
MANUAL_SOURCES = manual.c

# compile lex
LEX_OUTPUT = ${OUTPUT_DIR}/lex.yy.c
LEX_SOURCES = test.l

# compile bison
BISON_OUTPUT = ${OUTPUT_DIR}/test.tab.c
BISON_OUTPUT_HEADER = ${OUTPUT_DIR}/test.tab.h
BISON_SOURCES = test.y

# test lex output
TEST_OUTPUT = ${OUTPUT_DIR}/test
TEST_SOURCES = ${LEX_OUTPUT} ${BISON_OUTPUT}

.PHONY: all lex clean

all: clean lex

lex: ${BISON_OUTPUT} ${LEX_OUTPUT} ${TEST_OUTPUT}

${MANUAL_OUTPUT}: ${MANUAL_SOURCES}
	@mkdir -p ${OUTPUT_DIR}
	${CC} $^ -o $@ ${CFLAGS}

${BISON_OUTPUT}: ${BISON_SOURCES}
	@mkdir -p ${OUTPUT_DIR}
	${BISON} -d -o $@ $^

${LEX_OUTPUT}: ${LEX_SOURCES}
	@mkdir -p ${OUTPUT_DIR}
	${LEX} -o $@ $^

${TEST_OUTPUT}: ${TEST_SOURCES}
	${CC} $^ -lfl -o $@ ${CFLAGS}
	@rm -f ${TEST_SOURCES} ${BISON_OUTPUT_HEADER}

clean:
	rm -rf ${OUTPUT_DIR}