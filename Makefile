RMD=$(wildcard vignettes/*.Rmd) $(wildcard inst/examples/*.Rmd)

HTML=$(RMD:.Rmd=.html)

THEME_CHOOSER=TRUE
HIGHLIGHT_CHOOSER=TRUE

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
    library('knitrBootstrap');\
    library('rmarkdown');\
    render('$(notdir $<)')"

make clean:
	rm -f inst/examples/*.{html,md} vignettes/*.{html,md}

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
