RMD=$(wildcard inst/doc/*.Rmd) $(wildcard inst/examples/*.Rmd)

HTML=$(RMD:.Rmd=.html)

CHOOSER=c('boot', 'code')
BOOT_STYLE=NULL
CODE_STYLE=NULL

all: install $(HTML)

install:
	Rscript -e 'library(devtools);install(".")'

%_inline.html: %.html
	exec/encode.pl $< > $@

%.html: %.Rmd inst/templates/knitr_bootstrap.html
	Rscript -e "setwd('$(dir $<)');require('knitrBootstrap');knit_bootstrap('$(notdir $<)', chooser=$(CHOOSER), boot_style=$(BOOT_STYLE), code_style=$(CODE_STYLE))"

make clean:
	rm -f inst/doc/*.html inst/doc/*.md
