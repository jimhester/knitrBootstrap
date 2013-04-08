rmd=$(wildcard examples/*.Rmd)
html=$(rmd:.Rmd=.html)

stylesheet=
header=knitr_bootstrap.html
options=c('skip_style', 'base64_images', 'use_xhtml')

chooser=knitr_bootstrap_style_toggle.html
chooser_inline=$(chooser:.html=_inline.html)
both=$(chooser_inline:.html=_both.html)

style_chooser=

ifdef style_chooser
	header_temp:=$(both)
else
	header_temp:=$(header)
endif

$(both): $(chooser_inline)
	cat $(header) $(chooser_inline) > $(both)

all: $(html)

$(chooser_inline): $(chooser)
	encode.pl $< > $@

%.html: %.Rmd $(stylesheet) $(header_temp)
	echo "setwd('$(dir $<)');require('knitr');knit2html(stylesheet='$(CURDIR)/$(stylesheet)', header='$(CURDIR)/$(header_temp)', '$(CURDIR)/$<', output='$(notdir $@)', options=$(options))" > $(notdir $@).R
	R CMD BATCH $(notdir $@).R
	-rm $(notdir $@).{R,Rout}

make clean:
	rm -f examples/*.html examples/*.md $(chooser_inline) $(both)
