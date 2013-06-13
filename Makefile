RMD=$(wildcard inst/doc/*.Rmd) $(wildcard inst/examples/*.Rmd)

HTML=$(RMD:.Rmd=.html)

CHOOSER=c('boot', 'code')
BOOT_STYLE=NULL
CODE_STYLE=NULL

BASE=inst/templates/knitr_bootstrap.html

all: inst/templates/knitr_bootstrap.html $(HTML)

inst/examples/all.html: $(RMD) $(BASE)

$(BASE): $(filter-out $(BASE), $(wildcard inst/templates/*))
	(cat inst/templates/knitr_bootstrap_includes.html;\
  exec/wrap.pl '<script>' '</script>' inst/templates/knitr_bootstrap.js;\
  exec/wrap.pl '<style>' '</style>' inst/templates/knitr_bootstrap.css\
) > $@
	Rscript -e 'library(devtools);install(".")'

%_inline.html: %.html $(BASE)
	exec/encode.pl $< > $@

%.html: %.Rmd $(BASE)
	Rscript -e "\
    setwd('$(dir $<)');\
    require('knitrBootstrap');\
    knit_bootstrap('$(notdir $<)',\
      chooser=$(CHOOSER),\
      boot_style=$(BOOT_STYLE),\
      code_style=$(CODE_STYLE)\
    )"

make clean:
	rm -f inst/doc/*.html inst/doc/*.md
