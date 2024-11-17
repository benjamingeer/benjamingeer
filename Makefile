.PHONY: all bibliography gnuplot-svg clean

all: bibliography gnuplot-svg

bibliography:
	$(MAKE) -C bibliography

gnuplot-svg:
	$(MAKE) -C gnuplot-svg

clean:
	$(MAKE) -C bibliography clean
	$(MAKE) -C gnuplot-svg clean
