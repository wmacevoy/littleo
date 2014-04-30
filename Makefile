GRAPHICS_ASY=$(wildcard graphics/*.asy)
GRAPHICS_PDF=$(patsubst graphics/%.asy,graphics/%.pdf,$(GRAPHICS_ASY))
VIEW=evince

graphics/%.pdf : graphics/%.asy
	asy -f pdf -o $@ $<

all : graphs main.tex preamble.tex basics.tex
	pdflatex main
#	latexmk -pdf main

graphs : $(GRAPHICS_PDF)

pdf : all
	$(VIEW) main.pdf &
