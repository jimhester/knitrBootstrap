rmd=$(wildcard examples/*.Rmd)
html=$(rmd:.Rmd=.html)

stylesheet=
header=knitr_bootstrap.html
header_inline=$(header:.html=_inline.html)
options=c('skip_style', 'base64_images', 'use_xhtml', 'mathjax')

chooser=knitr_bootstrap_style_toggle.html
chooser_inline=$(chooser:.html=_inline.html)
both=$(chooser:.html=_both.html)

style_chooser=

standalone=

ifdef standalone
	header:=$(header_inline)
	chooser:=$(chooser_inline)
endif

ifdef style_chooser
	header_temp:=$(both)
else
	header_temp:=$(header)
endif


all: $(html)

$(both): $(header) $(chooser)
	cat $(header) $(chooser) > $(header_temp)


%_inline.html: %.html
	encode.pl $< > $@

%.html: %.Rmd $(stylesheet) $(header_temp)
	echo "setwd('$(dir $<)');require('knitr');knit2html(stylesheet='$(CURDIR)/$(stylesheet)', header='$(CURDIR)/$(header_temp)', '$(CURDIR)/$<', output='$(notdir $@)', options=$(options))" > $(notdir $@).R
	R CMD BATCH $(notdir $@).R
	-rm $(notdir $@).{R,Rout}

make clean:
	rm -f examples/*.html examples/*.md $(chooser_inline) $(both) $(header_inline)
