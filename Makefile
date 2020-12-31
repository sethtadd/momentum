# template makefile

# file names
EXE    := hellomake
CC     := g++
CFLAGS := 
DEPS   := hellomake.hpp
OBJ    := hellomake.o hellofunc.o glad.o

# directories
SRCDIR := src
INCDIR := include
OBJDIR := build
BINDIR := bin

# add directory prefixes
EXE  := $(BINDIR)/$(EXE)
DEPS := $(patsubst %, $(INCDIR)/%, $(DEPS))
OBJ  := $(patsubst %, $(OBJDIR)/%, $(OBJ))

# add include directory to compiler arguments
CFLAGS += -I./$(INCDIR) # this WON'T work if CFLAGS is overriden

# OS-specific settings
ifeq ($(OS), Windows_NT) # this Makefile will only work on Windows with MSYS, Cygwin, etc.
    LIBS     = 
    CLEANEXE = rm -v $(EXE).exe
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S), Linux) # Linux
        LIBS     = 
    endif
    ifeq ($(UNAME_S), Darwin) # MacOS
        LIBS     = -L/Users/sethtaddiken/Desktop/momentum/lib -lglfw3 -framework Cocoa -framework OpenGL -framework IOKit
    endif
    CLEANEXE = rm -v $(EXE) # for both Linux and MacOS
endif

# rules
make: $(OBJ)
	@mkdir -p $(BINDIR)
	$(CC) -o $(EXE) $^ $(CFLAGS) $(LIBS)

# for .cpp
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	@mkdir -p $(OBJDIR)
	$(CC) -c -o $@ $< $(CFLAGS)

# for .c
$(OBJDIR)/%.o: $(SRCDIR)/%.c $(DEPS)
	@mkdir -p $(OBJDIR)
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -v $(OBJ)
	$(CLEANEXE)
