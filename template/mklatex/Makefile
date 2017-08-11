all:
	platex main.tex
	pbibtex main
	platex main.tex
	platex main
	dvipdfmx main
clean:
	rm -f main.aux
	rm -f main.bbl
	rm -f main.blg
	rm -f main.dvi
	rm -f main.log
	rm -f main.nav
	rm -f main.out
	rm -f main.snm
	rm -f main.toc
