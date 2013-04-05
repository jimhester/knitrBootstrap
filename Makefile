rmd=$(wildcard examples/*.Rmd)
html=$(patsubst %.Rmd,%.html,$(rmd))
styles=$(wildcard styles/*.css)

stylesheet=
header=knitr_bootstrap.html
options=c('skip_style', 'base64_images', 'use_xhtml')

all: $(html) styles

%.html: %.Rmd $(stylesheet) $(header)
	echo "setwd('$(dir $<)');require('knitr');knit2html(stylesheet='../$(stylesheet)', header='../$(header)', '$(notdir $<)', output='$(notdir $@)', options=$(options))" > temp
	R CMD BATCH temp
	rm temp temp.Rout

styles: knitr_bootstrap_style_toggle.html knitr_bootstrap.html examples/all.Rmd
	encode.pl knitr_bootstrap_style_toggle.html > knitr_bootstrap_style_toggle_inline.html
	cat  knitr_bootstrap.html knitr_bootstrap_style_toggle_inline.html > test.html
	echo "setwd('examples');require('knitr');knit2html(stylesheet='', header='../test.html', 'all.Rmd', output='styles.html', options=$(options))" > temp
	R CMD BATCH temp
	rm temp temp.Rout
	rm test.html
	
make clean:
	-rm examples/*.html examples/*.md
