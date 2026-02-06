# Makefile for compiling lecture notes
# Usage:
#   make          - compile master.tex to PDF
#   make watch    - auto-recompile on changes (requires latexmk)
#   make clean    - remove build artifacts
#   make figures  - export all SVG figures via Inkscape

MAIN = master
LATEX = pdflatex
LATEXMK = latexmk
INKSCAPE = inkscape
FIGDIR = figures

.PHONY: all watch clean figures

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex preamble.tex $(wildcard lec_*.tex) $(wildcard $(FIGDIR)/*.pdf_tex)
	$(LATEX) -interaction=nonstopmode -shell-escape $(MAIN).tex
	$(LATEX) -interaction=nonstopmode -shell-escape $(MAIN).tex

watch:
	$(LATEXMK) -pdf -pvc -interaction=nonstopmode -shell-escape $(MAIN).tex

clean:
	rm -f $(MAIN).{pdf,aux,log,out,toc,fls,fdb_latexmk,synctex.gz}
	rm -f $(wildcard lec_*.aux)

# Export all SVG files in figures/ to pdf + pdf_tex via Inkscape
figures:
	@for svg in $(FIGDIR)/*.svg; do \
		if [ -f "$$svg" ]; then \
			echo "Exporting $$svg..."; \
			$(INKSCAPE) "$$svg" --export-area-drawing \
				--export-dpi 300 \
				--export-type=pdf \
				--export-latex \
				--export-filename="$${svg%.svg}.pdf"; \
		fi \
	done
	@echo "All figures exported."
