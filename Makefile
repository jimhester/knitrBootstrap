RMD=$(wildcard inst/doc/*.Rmd) $(wildcard inst/examples/*.Rmd)

HTML=$(RMD:.Rmd=.html)

CHOOSER=c('boot', 'code')
BOOT_STYLE=NULL
CODE_STYLE=NULL
NAV_TYPE='offscreen'
THUMBSIZE='col-md-3'
SHOW_CODE=FALSE
SHOW_OUTPUT=TRUE
SHOW_PLOT=TRUE

R_package=inst/templates/R_package

BASE=$(filter-out $(R_package), $(wildcard inst/templates/*)) $(wildcard R/*.R)

all: $(HTML) install

install: $(R_package)

$(R_package): $(BASE)
	Rscript -e 'library(devtools);install(".", quick=T)'
	touch $(R_package)

inst/examples/all.html: $(RMD) $(R_package)

%_inline.html: %.html $(R_package)
	exec/encode.pl $< > $@

%.html: %.Rmd $(R_package)
	Rscript -e "\
    setwd('$(dir $<)');\
    require('knitrBootstrap');\
    knit_bootstrap('$(notdir $<)',\
      chooser=$(CHOOSER),\
      boot_style=$(BOOT_STYLE),\
      code_style=$(CODE_STYLE),\
      nav_type=$(NAV_TYPE),\
      thumbsize=$(THUMBSIZE),\
      show_code=$(SHOW_CODE),\
      show_output=$(SHOW_OUTPUT),\
      show_plot=$(SHOW_PLOT),\
    )"

make clean:
	rm -f inst/doc/*.html inst/doc/*.md
