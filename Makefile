LATEX = pdflatex
DEST = build
SRCS = calc.tex diffeq_kr.tex diffeq.tex mathstat.tex phys.tex task2.tex Algebra/algebra1.tex Nets/nets1.tex ФОП/fop.tex MatPhys/matphys1.tex MatPhys/matphys_sem1.tex MatPhys/matphys_ht1.tex MatPhys/mathphys_ht2.tex MatPhys/matphys_ht3.tex
PDFS = $(SRCS:.tex=.pdf)


all: pdf

pdf: $(PDFS)
	rm $(DEST)/*.aux
	rm $(DEST)/*.out
	rm $(DEST)/*.log

$(PDFS): %.pdf: %.tex
	mkdir -p $(DEST)
	$(LATEX) -interaction nonstopmode -output-directory $(DEST) $<

MatPhys/matphys_ht3.pdf: MatPhys/matphys_ht3.tex
	mkdir -p $(DEST)/$@
	rm -r $(DEST)/$@
	cp $< $(DEST)/$<
	sed -i 's/img/MatPhys\/img/' $(DEST)/$<
	$(LATEX) -interaction nonstopmode -output-directory $(DEST) $(DEST)/$<

clean:
	-rm -r $(DEST)
