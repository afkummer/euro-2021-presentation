# Uses `latexmk` to handle dependencies and needs for recompilation.

all:
	-latexmk -bibtex -pdf -interaction=nonstopmode

clean:
	latexmk -c

mrproper:
	latexmk -C

.PHONY: all clean mrproper

