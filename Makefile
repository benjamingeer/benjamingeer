.PHONY: all bibliography svg clean

all: bibliography svg

bibliography:
	$(MAKE) -C bibliography

svg:
	$(MAKE) -C svg

clean:
	$(MAKE) -C bibliography clean
	$(MAKE) -C svg clean
