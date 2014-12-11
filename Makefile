all: Dokumentation.pdf

Dokumentation.pdf: Dokumentation.tex content/* tex/*
	mkdir -p build
	TEXINPUTS=build:.: lualatex --output-directory=build Dokumentation.tex
	BIBINPUTS=build:.  biber build/Dokumentation.bcf
	TEXINPUTS=build:.: lualatex --output-directory=build Dokumentation.tex
	TEXINPUTS=build:.: lualatex --output-directory=build Dokumentation.tex
	mv build/Dokumentation.pdf Dokumentation.pdf

clean:
	rm -rf build
