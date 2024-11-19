.PHONY: all clean

INPUT = index.ipynb
OUTPUT = index.md

all: $(OUTPUT)

$(OUTPUT): $(INPUT)
	jupyter nbconvert --to markdown $< \
		--TagRemovePreprocessor.enabled=True \
		--TagRemovePreprocessor.remove_cell_tags=hide_cell \
		--TagRemovePreprocessor.remove_input_tags=hide_input \
		--TagRemovePreprocessor.remove_all_outputs_tags=hide_output \

clean:
	rm -rf $(OUTPUT) *_files
