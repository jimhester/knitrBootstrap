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
	Rscript -e 'options(repos=c(CRAN="http://cran.rstudio.com/"));library(devtools);install()'
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

#from yihui's knitr Makefile
PKGNAME := $(shell sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGVERS := $(shell sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGSRC  := $(shell basename `pwd`)

# convert markdown to R's NEWS format
news: NEWS.md
	sed -e 's/^-/  -/' -e 's/^## *//' -e 's/^#/\t\t/' < NEWS.md | fmt -80 -s > NEWS

docs:
	Rscript -e 'library(devtools);library(methods);library(utils);document()'

build:
	cd ..;\
	R CMD build $(PKGSRC)

check: build
	cd ..;\
	R CMD check $(PKGNAME)_$(PKGVERS).tar.gz --as-cran
