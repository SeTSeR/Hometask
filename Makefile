PDFS = calc.pdf diffeq_kr.pdf diffeq.pdf mathstat.pdf phys.pdf task.pdf task2.pdf Algebra/algebra1.pdf Nets/nets1.pdf ФОП/fop.pdf MatPhys/matphys1.pdf MatPhys/matphys_sem1.pdf MatPhys/matphys_ht1.pdf MatPhys/mathphys_ht2.pdf MatPhys/matphys_ht3.pdf
TEXS = $(PDFS:.pdf=.tex)
SRCS = $(PDFS:.pdf=.org)
EMACS = emacs

all: pdf

pdf: $(PDFS)

tex: $(TEXS)

$(PDFS): %.pdf: %.org
	$(EMACS) --batch $< -f org-latex-export-to-pdf

$(TEXS): %.tex: %.org
	$(EMACS) --batch $< -f org-latex-export-to-latex

clean:
	rm *.pdf
	rm Algebra/*.pdf
	rm MatPhys/*.pdf
	rm Nets/*.pdf
	rm ФОП/*.pdf
	rm *.tex
	rm Algebra/*.tex
	rm MatPhys/*.tex
	rm Nets/*tex
	rm ФОП/*tex
