EMACS = emacs
LATEX = pdflatex
DEST = build/
SRCS = calc.org diffeq_kr.org diffeq.org mathstat.org phys.org task2.org Algebra/algebra1.org Nets/nets1.org ФОП/fop.org MatPhys/matphys1.org MatPhys/matphys_sem1.org MatPhys/matphys_ht1.org MatPhys/mathphys_ht2.org MatPhys/matphys_ht3.org
TEXS = $(SRCS:.org=.tex)
PDFS = $(SRCS:.org=.pdf)


all: pdf

pdf: $(PDFS)

tex: $(TEXS)

$(PDFS): %.pdf: %.tex
	mkdir -p $(DEST)
	$(LATEX) -interaction nonstopmode -output-directory $(DEST) $<

MatPhys/matphys_ht3.pdf: MatPhys/matphys_ht3.tex
	mkdir -p $(DEST)
	sed -i 's/img/MatPhys\/img/' $<
	$(LATEX) -interaction nonstopmode -output-directory $(DEST) $<

$(TEXS): %.tex: %.org
	$(EMACS) --batch $< -f org-latex-export-to-latex

clean:
	-rm -r $(DEST)
	-rm *.tex
	-rm Algebra/*.tex
	-rm MatPhys/*.tex
	-rm Nets/*tex
	-rm ФОП/*tex
