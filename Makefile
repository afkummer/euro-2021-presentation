# Uses `latexmk` to handle dependencies and needs for recompilation.

all:
	-latexmk -bibtex -pdf -interaction=nonstopmode main

clean:
	latexmk -c main

mrproper:
	latexmk -C main

.PHONY: all clean mrproper

