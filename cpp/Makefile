# c++ compile flags
CXXFLAGS=-Iinclude -g -O2 -stdlib=libc++ -std=c++11

# link flags
LDFLAGS=-lgmpxx -lgmp

# all not-main and not-test source files in the src folder
PARTS=$(shell find src -name '*.cpp' -and -not \( -name '.*' -or -name 'main_*' -or -name 'test_*' \) )
# src/XXXX.cpp -> tmp/XXXX.cpp.o object files
PARTO=$(patsubst src/%.cpp,tmp/%.cpp.o,$(PARTS))

# main source files in src
MAINS=$(shell find src -name 'main_*.cpp')

# src/main_XXXX.cpp -> bin/XXXX executables
MAINX=$(patsubst src/main_%.cpp,bin/%,$(MAINS))

# test source files in src
TESTS=$(shell find src -name 'test_*.cpp')

# src/test_XXXX.cpp -> bin/test_XXXX test executables
TESTX=$(patsubst src/test_%.cpp,bin/test_%,$(TESTS))

.PHONY: all
all : mains tests

.PHONY: mains
mains : $(MAINX)

.PHONY: tests
tests : $(TESTX)

.PHONY: clean
clean :
	/bin/rm -rf tmp/* bin/*
	find . \( -name '*~' -or -name '*#' -or -name '.#*' \) -print0 | xargs -0 /bin/rm -rf

# use compiler to automatically discover #include - dependencies...
tmp/%.cpp.d: src/%.cpp
	mkdir -p `dirname $@`
	$(CXX) $(CXXFLAGS) -MM -MT '$(patsubst src/%.cpp,tmp/%.cpp.o,$<)' $< > $@

# use (and maybe update) dependency rules unless I am cleaning
ifneq (clean,$(MAKECMDGOALS))
-include $(patsubst src/%.cpp,tmp/%.cpp.d,$(PARTS) $(MAINS) $(TESTS))
endif

# generic compile a c++ source file rule
tmp/%.cpp.o: src/%.cpp
	mkdir -p `dirname $@`
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# generic link an executable rule
bin/% : tmp/main_%.cpp.o $(PARTO) 
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

# generic link a test executable rule
bin/test_% : tmp/test_%.cpp.o $(PARTO)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

