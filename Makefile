
all: test

.PHONY: sudoku-test
sudoku-test: build/SudokuValidatorTest
	./build/SudokuValidatorTest

.PHONY: test
test: build/AppsTest sudoku-test
	./build/AppsTest

build/AppsTest: $(wildcard *.juvix) $(wildcard ./**/*.juvix)
	@mkdir -p build
	juvix compile -o build/AppsTest test/Test/AppsTest.juvix

build/SudokuValidatorTest: $(wildcard ./Sudoku/**/*.juvix) 
	@mkdir -p build
	juvix compile -o build/SudokuValidatorTest test/Test/SudokuValidatorTest.juvix

.PHONY: juvix-clean
juvix-clean:
	@juvix clean
	@(cd test && exec juvix clean)

.PHONY: clean
clean: juvix-clean
	@rm -rf build

format:
	@juvix format

html: 
	juvix html --output-dir=docs Apps/TwoPartyExchange.juvix
	juvix html --output-dir=docs Apps/Sudoku.juvix
