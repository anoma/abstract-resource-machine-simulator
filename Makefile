
all: test

deps/containers:
	@mkdir -p deps/
	@git clone --branch v0.4.1 --depth 1 https://github.com/anoma/juvix-containers.git deps/containers
	$(MAKE) -C deps/containers deps

deps/stdlib:
	@mkdir -p deps/
	@git clone https://github.com/anoma/juvix-stdlib.git deps/stdlib
	@git -C deps/stdlib checkout e6b7c6fff1cd84c86f10ace080c2147cdbd0aaec

deps/test:
	@mkdir -p deps/
	@git clone --branch v0.4.0 --depth 1 https://github.com/anoma/juvix-test.git deps/test
	$(MAKE) -C deps/test deps

deps: deps/containers deps/stdlib deps/test

build/Test: $(wildcard *.juvix) $(wildcard ./**/*.juvix) deps
	@mkdir -p build
	juvix compile -o build/Test Test.juvix

build/SudokuValidatorTest: $(wildcard ./Sudoku/**/*.juvix) $(wildcard ./deps/**/*.juvix) deps
	@mkdir -p build
	juvix compile -o build/SudokuValidatorTest SudokuValidatorTest.juvix

.PHONY: sudoku-test
sudoku-test: build/SudokuValidatorTest
	./build/SudokuValidatorTest

.PHONY: test
test: build/Test sudoku-test
	./build/Test

.PHONY: clean-deps
clean-deps:
	@rm -rf deps/

.PHONY: clean-build
clean-build:
	@rm -rf build/

.PHONY: clean
clean: clean-deps clean-build
