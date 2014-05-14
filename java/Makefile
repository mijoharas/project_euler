JAVA=javac
SRCDIR=src
BINDIR=bin

$(BINDIR)/%.class: $(SRCDIR)/%.java
	$(JAVA) $< -d $(BINDIR)

clean:
	rm -f $(BINDIR)/*
