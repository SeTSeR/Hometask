LATEX = pdflatex
DEST = build
SRCS = calc.tex diffeq_kr.tex diffeq.tex mathstat.tex phys.tex task2.tex Algebra/algebra1.tex  MatPhys/matphys1.tex MatPhys/matphys_sem1.tex MatPhys/matphys_ht1.tex MatPhys/mathphys_ht2.tex MatPhys/matphys_ht3.tex MatPhys/matphys_ht4.tex MatPhys/matphys_ht5.tex MatPhys/matphys_ht6.tex MatPhys/matphys_ht7.tex MatPhys/matphys_ht8.tex MatPhys/matphys_ht9.tex MatPhys/matphys_ht10.tex Cybernetics/cybernetics.tex Cybernetics/cybernetics_sem.tex Complexity/complexity.tex Optimization/optimization.tex Funcan/funcan.tex
PDFS = $(SRCS:.tex=.pdf)


all: pdf

pdf: $(PDFS)
	rm $(DEST)/*.aux
	rm $(DEST)/*.out
	rm $(DEST)/*.log
	rm $(DEST)/MatPhys/matphys_ht3.tex

$(PDFS): %.pdf: %.tex
	mkdir -p $(DEST)
	$(LATEX) -interaction nonstopmode -shell-escape -output-directory $(DEST) $<

MatPhys/matphys_ht3.pdf: MatPhys/matphys_ht3.tex
	mkdir -p $(DEST)/$@
	rm -r $(DEST)/$@
	cp $< $(DEST)/$<
	sed -i 's/img/MatPhys\/img/' $(DEST)/$<
	$(LATEX) -interaction nonstopmode -shell-escape -output-directory $(DEST) $(DEST)/$<

MatPhys/matphys_ht10.pdf: MatPhys/matphys_ht10.tex
	mkdir -p $(DEST)/$@
	rm -r $(DEST)/$@
	cp $< $(DEST)/$<
	sed -i 's/img/MatPhys\/img/' $(DEST)/$<
	$(LATEX) -interaction nonstopmode -shell-escape -output-directory $(DEST) $(DEST)/$<

clean:
	-rm -r $(DEST)
