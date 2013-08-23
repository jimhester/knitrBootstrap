RMD=$(wildcard inst/doc/*.Rmd) $(wildcard inst/examples/*.Rmd)

HTML=$(RMD:.Rmd=.html)

CHOOSER=c('boot', 'code')
BOOT_STYLE=NULL
CODE_STYLE=NULL
THUMBSIZE=3
SHOW_CODE=FALSE
SHOW_OUTPUT=TRUE
SHOW_FIGURE=TRUE

BASE=$(filter-out R_package, $(wildcard inst/templates/*)) $(wildcard R/*.R)

all: $(HTML) install

install: R_package

R_package: $(BASE)
	Rscript -e 'library(devtools);install(".", quick=T)'
	touch R_package

inst/examples/all.html: $(RMD) R_package

%_inline.html: %.html R_package
	exec/encode.pl $< > $@

%.html: %.Rmd R_package
	Rscript -e "\
    setwd('$(dir $<)');\
    require('knitrBootstrap');\
    knit_bootstrap('$(notdir $<)',\
      chooser=$(CHOOSER),\
      boot_style=$(BOOT_STYLE),\
      code_style=$(CODE_STYLE),\
      thumbsize=$(THUMBSIZE),\
      show_code=$(SHOW_CODE),\
      show_output=$(SHOW_OUTPUT),\
      show_figure=$(SHOW_FIGURE)\
    )"

make clean:
	rm -f inst/doc/*.html inst/doc/*.md
