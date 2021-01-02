# momentum makefile

# file names
EXE    := momentum
CFLAGS := 
DEPS   := App.hpp
OBJ    := main.o App.o glad.o

# directories
SRCDIR := src
INCDIR := include
LIBDIR := lib
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
        LIBS     = -lglfw3 -framework Cocoa -framework OpenGL -framework IOKit
    endif
    CLEANEXE = rm -v $(EXE) # for both Linux and MacOS
endif

# rules
make: $(OBJ)
	@mkdir -p $(BINDIR)
	g++ -o $(EXE) $^ $(CFLAGS) -L./$(LIBDIR) $(LIBS)

# Windows subsystem for Linux
subsys: $(OBJ)
	echo $(UNAME_S)
	echo $(OS)
    # --------------------------------------
    # --------- do your stuff joey ---------
    # --------------------------------------

# for .cpp
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	@mkdir -p $(OBJDIR)
	g++ -c -o $@ $< $(CFLAGS)

# for .c
$(OBJDIR)/%.o: $(SRCDIR)/%.c $(DEPS)
	@mkdir -p $(OBJDIR)
	gcc -c -o $@ $< $(CFLAGS)

clean:
	rm -v $(OBJ)
	$(CLEANEXE)
