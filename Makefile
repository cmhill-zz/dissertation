OUTNAME = thesis-$(shell date +%F).pdf

all: thesis.pdf

thesis.pdf: mainthesis.tex
	pdflatex mainthesis.tex; bibtex mainthesis; pdflatex mainthesis.tex; pdflatex mainthesis.tex;
	mv mainthesis.pdf ${OUTNAME}

clean:
	rm -rf q-compression*.pdf
	rm -f q-compression.log 
	rm -f q-compression.dvi 
	rm -f q-compression.aux 
	rm -f q-compression.bbl
	rm -f q-compression.blg
	rm -f q-compression.bcf