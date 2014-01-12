
# Simple operation: make a PDF and open it in Preview.

all: wk01-04-reconstruction.tex
	pdflatex --shell-escape wk01-04-reconstruction.tex && open wk01-04-reconstruction.pdf

better-notes: 
	pandoc --template=./pandoctemplate.tex -V notes=true pandocinput.md -o pandocoutput.pdf && open pandocoutput.pdf	

better-no-notes: 
	pandoc --template=./pandoctemplate.tex pandocinput.md -o pandocoutput.pdf && open pandocoutput.pdf	


# default to make document with notes
# see http://www.astro.gla.ac.uk/~matthew/blog/?p=376
default: withnotes

withnotes: wk01-04-reconstruction.tex breaking-things.tex
	pdflatex '\newcommand{\withnotes}{}\input{wk01-04-reconstruction.tex}'
	pdflatex '\newcommand{\withnotes}{}\input{breaking-things.tex}'
    
withoutnotes: wk01-04-reconstruction.tex breaking-things.tex
	pdflatex $?
	pdflatex $?
	
option2: another-option.md
	pandoc --from=markdown+raw_tex --variable=withnotes --template=./template.tex another-option.md -o another-option.tex
	# This generates something ugly with the Computer Modern font.
	pandoc --from=latex --standalone another-option.tex -o another-option-pandoc.pdf
	# This, OTOH, looks nice.
	pdflatex another-option.tex -o another-option.pdf && mv another-option.pdf another-option-pdflatex.pdf
	
	