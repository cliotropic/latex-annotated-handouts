
# Simple operation: make a PDF and open it in Preview.

all: wk01-04-reconstruction.tex
	pdflatex --shell-escape wk01-04-reconstruction.tex && open wk01-04-reconstruction.pdf
	

# default to make document with notes
# see http://www.astro.gla.ac.uk/~matthew/blog/?p=376
default: withnotes

withnotes: wk01-04-reconstruction.tex breaking-things.tex
	pdflatex '\newcommand{\withnotes}{}\input{wk01-04-reconstruction.tex}'
	pdflatex '\newcommand{\withnotes}{}\input{breaking-things.tex}'
    
withoutnotes: wk01-04-reconstruction.tex breaking-things.tex
	pdflatex $?
	pdflatex $?