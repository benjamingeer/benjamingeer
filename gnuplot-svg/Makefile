.PHONY: all clean

INPUT = $(wildcard *.gp)
TEX = $(patsubst %.gp, %.tex, $(INPUT))
INC = $(patsubst %.gp, %-inc.pdf, $(INPUT))
PDF = $(patsubst %.gp, %.pdf, $(INPUT))
SVG = $(patsubst %.gp, %.svg, $(INPUT))

all: $(TEX) $(INC) $(PDF) $(SVG)

%.tex %-inc.pdf: %.gp
	gnuplot $<

%.pdf: %.tex %-inc.pdf
	pdflatex $<

%.svg: %.pdf
	pdftocairo $< $@ -svg 
	cp $@ ../static/figures

clean:
	rm -f $(TEX) $(INC) $(PDF) $(SVG) *.log *.aux
