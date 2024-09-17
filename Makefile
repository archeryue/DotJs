# Compiler
CXX = g++
CC = gcc

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++11
CFLAGS = -Wall -Wextra

# Duktape include directory
INCLUDE = -I./include

# Target executable name
TARGET = out/duktape_example

# Source files
SOURCES = main.cpp
DUKTAPE_SOURCE = include/duktape.c

# Object files
OBJECTS = $(SOURCES:.cpp=.o) $(DUKTAPE_SOURCE:.c=.o)

# Default target
all: $(TARGET)

# Linking object files to create the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $(TARGET)

# Compiling C++ source files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

# Compiling C source files (for duktape.c)
include/duktape.o: include/duktape.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

# Clean up
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all clean