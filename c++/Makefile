CC=g++
CFLAGS=-Wall -g -std=c++11 -lm
OBJDIR=obj
SRCDIR=src
BINDIR=bin

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) -c -o $@ $< $(CFLAGS)

$(BINDIR)/%: $(OBJDIR)/%.o
	$(CC) -o $@ $< $(CFLAGS)

%: $(BINDIR)/%
.PHONY: $(patsubst $(SRCDIR)/%.cpp,%,$(wildcard $(SRCDIR)/*.cpp))

clean:
	rm -f $(BINDIR)/* $(OBJDIR)/*
