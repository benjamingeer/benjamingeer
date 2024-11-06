.PHONY: all clean

INPUT = $(wildcard *.bib.md)
OUTPUT = $(patsubst %.bib.md, %.refs.md, $(INPUT))

all: $(OUTPUT)

%.refs.md: %.bib.md %.bib
	pandoc -t markdown_strict --citeproc --wrap=none $< -o $@

clean:
	rm -f $(OUTPUT) *~
