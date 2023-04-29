
all: test

deps/containers:
	@mkdir -p deps/
	@git clone --branch v0.2.0 --depth 1 https://github.com/paulcadman/containers.git deps/containers
	$(MAKE) -C deps/containers deps

deps/traits:
	@mkdir -p deps/
	@git clone --branch v0.1.0 --depth 1 https://github.com/paulcadman/traits.git deps/traits

deps: deps/containers deps/traits

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
