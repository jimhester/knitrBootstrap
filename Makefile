RMD=$(wildcard inst/doc/*.Rmd)
HTML=$(RMD:.Rmd=.html)

CHOOSER=c('boot', 'code')
BOOT_STYLE=NULL
CODE_STYLE=NULL

all: $(HTML)

%_inline.html: %.html
	exec/encode.pl $< > $@

%.html: %.Rmd $(stylesheet) $(header_temp)
	Rscript -e "setwd('$(dir $<)');require('knitrBootstrap');knit_bootstrap('$(notdir $^)', chooser=$(CHOOSER), boot_style=$(BOOT_STYLE), code_style=$(CODE_STYLE))"

make clean:
	rm -f examples/*.html examples/*.md
