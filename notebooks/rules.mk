.PHONY: install clean

INPUT := index.ipynb
OUTPUT := index.md
SUBDIR := $(shell basename $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST)))))

$(OUTPUT): $(INPUT)
	jupyter nbconvert --to markdown $< \
		--TagRemovePreprocessor.enabled=True \
		--TagRemovePreprocessor.remove_cell_tags=hide_cell \
		--TagRemovePreprocessor.remove_input_tags=hide_input \
		--TagRemovePreprocessor.remove_all_outputs_tags=hide_output

install: $(OUTPUT)
	rm -rf ../../content/en/post/$(SUBDIR)
	mkdir -p ../../content/en/post/$(SUBDIR)
	cp -R $(OUTPUT) *_files ../../content/en/post/$(SUBDIR)

clean:
	rm -rf $(OUTPUT) *_files
