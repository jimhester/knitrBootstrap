RMD=$(wildcard inst/doc/*.Rmd) $(wildcard inst/examples/*.Rmd)

HTML=$(RMD:.Rmd=.html)

CHOOSER=c('boot', 'code')
BOOT_STYLE=NULL
CODE_STYLE=NULL

all: install $(HTML)

inst/templates/knitr_bootstrap.html: inst/templates/knitr_bootstrap_includes.html inst/templates/knitr_bootstrap.js inst/templates/knitr_bootstrap.css
	(cat inst/templates/knitr_bootstrap_includes.html; exec/wrap.pl '<script>' '</script>' inst/templates/knitr_bootstrap.js; exec/wrap.pl '<style>' '</style>' inst/templates/knitr_bootstrap.css) > $@

install: inst/templates/knitr_bootstrap.html inst/templates/knitr_bootstrap_style_toggle.html inst/templates/knitr_bootstrap_code_style_toggle.html
	Rscript -e 'library(devtools);install(".")'

%_inline.html: %.html
	exec/encode.pl $< > $@

%.html: %.Rmd install
	Rscript -e "setwd('$(dir $<)');require('knitrBootstrap');knit_bootstrap('$(notdir $<)', chooser=$(CHOOSER), boot_style=$(BOOT_STYLE), code_style=$(CODE_STYLE))"

make clean:
	rm -f inst/doc/*.html inst/doc/*.md
