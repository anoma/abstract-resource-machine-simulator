
all: test

deps/containers:
	@mkdir -p deps/
	@git clone --branch main --depth 1 https://github.com/paulcadman/containers.git deps/containers

build/Test: Test.juvix deps/containers
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
