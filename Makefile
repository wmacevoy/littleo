GRAPHICS_ASY=$(wildcard graphics/*.asy)
GRAPHICS_PDF=$(patsubst graphics/%.asy,graphics/%.pdf,$(GRAPHICS_ASY))
graphics/%.pdf : graphics/%.asy settings.asy
	asy -f pdf -o $@ $<
VIEW=evince
all : graphics
	latexmk -pdf main

graphics : $(GRAPHICS_PDF)

graphs : graphics
	$(VIEW) $(GRAPHICS_PDF)

pdf : all
	$(VIEW) main.pdf
