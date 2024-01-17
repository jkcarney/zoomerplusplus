# Compiler settings - Can change to clang++ if desired
CXX = clang++

# Compiler flags
CXXFLAGS = -Wall -Iinclude

# Source directory and build directory
SRCDIR = examples
BUILDDIR = build

# Find all .cpp files in the SRCDIR
SOURCES = $(wildcard $(SRCDIR)/*.cpp)

# Replace .cpp with nothing in SOURCES then prefix all with BUILDDIR/
TARGETS = $(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%,$(SOURCES))

# Default target
all: $(TARGETS)

# Generic rule for building the programs
$(BUILDDIR)/%: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

# Create the build directory if it doesn't exist
$(shell mkdir -p $(BUILDDIR))

# Clean up
clean:
	rm -rf $(BUILDDIR)
