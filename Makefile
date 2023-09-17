
all: test

.PHONY: sudoku-test
sudoku-test: build/SudokuValidatorTest
	./build/SudokuValidatorTest

.PHONY: test
test: build/AppsTest sudoku-test
	./build/AppsTest

build/AppsTest: $(wildcard *.juvix) $(wildcard ./**/*.juvix)
	@mkdir -p build
	juvix compile -o build/AppsTest Test/AppsTest.juvix

build/SudokuValidatorTest: $(wildcard ./Sudoku/**/*.juvix) 
	@mkdir -p build
	juvix compile -o build/SudokuValidatorTest Test/SudokuValidatorTest.juvix

.PHONY: juvix-clean
juvix-clean:
	@juvix clean

.PHONY: clean
clean: juvix-clean

format:
	@juvix format

html: 
	juvix html --output-dir=docs Apps/TwoPartyExchange.juvix
	juvix html --output-dir=docs Apps/Sudoku.juvix