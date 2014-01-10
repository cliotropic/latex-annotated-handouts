
# Simple operation: make a PDF and open it in Preview.

all: wk01-04-reconstruction.tex
	pdflatex --shell-escape wk01-04-reconstruction.tex && open wk01-04-reconstruction.pdf
	
