all:
	"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "library('knitrBootstrap'); library('rmarkdown'); for(i in list.files(pattern='.Rmd')) render(i, bootstrap_document(theme.chooser = TRUE, highlight.chooser = TRUE))"
clean:
	rm -fr *_files