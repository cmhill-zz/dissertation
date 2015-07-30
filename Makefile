OUTNAME = thesis-$(shell date +%F).pdf

all: thesis.pdf

thesis.pdf: mainthesis.tex
	perl latexpand mainthesis.tex > completethesis.tex
	dos2unix completethesis.tex
	latexdiff -t UNDERLINE origthesis.tex completethesis.tex > diff.tex
	#dos2unix diff.tex
	#sed -i 's/^M//g' diff.tex
	#latexdiff --flatten -t CTRADITIONAL origthesis.tex mainthesis.tex > diff.tex
	pdflatex diff.tex; bibtex diff; pdflatex diff.tex; pdflatex diff.tex;
	#pdflatex mainthesis.tex; bibtex mainthesis; pdflatex mainthesis.tex; pdflatex mainthesis.tex;
	#mv diff.pdf ${OUTNAME}

clean:
	rm -rf diff*.pdf
	rm -f diff.log
	rm -f diff.dvi
	rm -f diff.aux
	rm -f diff.bbl
	rm -f diff.blg
	rm -f diff.bcf
	rm -rf mainthesis*.pdf
	rm -f mainthesis.log
	rm -f mainthesis.dvi
	rm -f mainthesis.aux
	rm -f mainthesis.bbl
	rm -f mainthesis.blg
	rm -f mainthesis.bcf
