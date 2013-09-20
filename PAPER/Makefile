all: paper.pdf

paper.pdf: paper.ps
	ps2pdf paper.ps

paper.ps: paper.dvi
	dvips -t a4 -G0 paper.dvi -o paper.ps

paper.dvi: paper.tex introduction.tex disr.tex simulation.tex implementation.tex bibliography.bib
	latex paper
	bibtex paper
	latex paper
	latex paper

showdvi: paper.dvi
	open paper.dvi&

showps: paper.ps
	open paper.ps&

showpdf: paper.pdf
	open paper.pdf&

clean:
	rm -f *.pdf *.aux *.bbl *.log *.blg *.dvi *.ps
