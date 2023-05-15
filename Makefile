
all: test

deps/containers:
	@mkdir -p deps/
	@git clone --branch v0.4.1 --depth 1 https://github.com/anoma/juvix-containers.git deps/containers
	$(MAKE) -C deps/containers deps

deps/stdlib:
	@mkdir -p deps/
	@git clone https://github.com/anoma/juvix-stdlib.git deps/stdlib
	@git -C deps/stdlib checkout c2a327139e9cd166e4e3241f4de192f375a94437

deps/test:
	@mkdir -p deps/
	@git clone --branch v0.4.0 --depth 1 https://github.com/anoma/juvix-test.git deps/test
	$(MAKE) -C deps/test deps

deps: deps/containers deps/stdlib deps/test

build/Test: $(wildcard *.juvix) $(wildcard ./**/*.juvix) deps
	@mkdir -p build
	juvix compile -o build/Test Test.juvix

.PHONY: test
test: build/Test
	./build/Test

.PHONY: clean-deps
clean-deps:
	@rm -rf deps/

.PHONY: clean-build
clean-build:
	@rm -rf build/

.PHONY: clean
clean: clean-deps clean-build
