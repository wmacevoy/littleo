all :
	pdflatex main
	cd graphics; for f in *.asy; do asy -f pdf $$f; done
	latexmk -pdf main

pdf : all
	evince main.pdf &
