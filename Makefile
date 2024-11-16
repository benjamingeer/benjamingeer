.PHONY: all bibliography svg clean

all: bibliography svg

bibliography:
	$(MAKE) -C content/bibliography

svg:
	$(MAKE) -C content/svg

clean:
	$(MAKE) -C content/bibliography clean
	$(MAKE) -C content/svg clean
