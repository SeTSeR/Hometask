LATEX = pdflatex
PANDOC = pandoc
DEST = build
SRCS = calc.org diffeq_kr.org diffeq.org mathstat.org phys.org task2.org Algebra/algebra1.org Nets/nets1.org ФОП/fop.org MatPhys/matphys1.org MatPhys/matphys_sem1.org MatPhys/matphys_ht1.org MatPhys/mathphys_ht2.org MatPhys/matphys_ht3.org
PDFS = $(SRCS:.org=.pdf)


all: pdf

pdf: $(PDFS)

$(PDFS): %.pdf: %.org
	mkdir -p $(DEST)/$@
	rm -r $(DEST)/$@
	$(PANDOC) -s $< -o $(DEST)/$@

MatPhys/matphys_ht3.pdf: MatPhys/matphys_ht3.org
	mkdir -p $(DEST)/$@
	rm -r $(DEST)/$@
	cp $< $(DEST)/$<
	sed -i 's/img/MatPhys\/img/' $(DEST)/$<
	$(PANDOC) -s $(DEST)/$< -o $(DEST)/$@

clean:
	-rm -r $(DEST)
