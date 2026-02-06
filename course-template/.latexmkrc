# latexmk configuration for continuous compilation
$pdf_mode = 1;             # use pdflatex
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape %O %S';
$out_dir = '.';
$clean_ext = 'synctex.gz fls fdb_latexmk';
