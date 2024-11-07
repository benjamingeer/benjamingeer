.PHONY: all clean

INPUT = $(wildcard *.bib)
BIBMDFILES = $(patsubst %.bib, %.bib.md, $(INPUT))
REFSMDFILES = $(patsubst %.bib, %.refs.md, $(INPUT))

all: $(BIBMDFILES) $(REFSMDFILES)

%.bib.md: %.bib
	./makebibmd.sh $< > $@

%.refs.md: %.bib.md
	pandoc -t markdown_strict --citeproc --wrap=none $< -o $@

clean:
	rm -f $(BIBMDFILES) $(REFSMDFILES)
