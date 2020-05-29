# Commands
RM = rm -rf
MKDIR = mkdir -p

# Folders
BUILD  := build
SOURCE := source
INCLUDE := include

# Files
TARGET  := daisy
SOURCES := $(shell find $(SOURCE) -name "*.cpp" -printf "%f\n")
OBJECTS := $(addprefix $(BUILD)/, $(SOURCES:.cpp=.o))

# Compiler
CXX = g++
CXXFLAGS = -pedantic -Wall -Wextra -I $(INCLUDE)

# Objects
$(BUILD)/%.o: $(SOURCE)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $^

$(SOURCE):
	@$(MKDIR) $(SOURCE)

$(BUILD):
	@$(MKDIR) $(BUILD)

clean:
	@$(RM) $(TARGET) $(OBJECTS)
