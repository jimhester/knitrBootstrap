rmd=$(wildcard examples/*.Rmd)
html=$(patsubst %.Rmd,%.html,$(rmd))

stylesheet=knitr_bootstrap.css
header=knitr_bootstrap.html
options=c('skip_style', 'base64_images', 'use_xhtml')

all: $(html)

%.html: %.Rmd $(stylesheet) $(header)
	echo "setwd('$(dir $<)');require('knitr');knit2html(stylesheet='../$(stylesheet)', header='../$(header)', '$(notdir $<)', output='$(notdir $@)', options=$(options))" > temp
	R CMD BATCH temp
	rm temp temp.Rout

make clean:
	-rm examples/*.html examples/*.md
