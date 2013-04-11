rmd=$(wildcard examples/*.Rmd)
html=$(rmd:.Rmd=.html)

stylesheet=
header=knitr_bootstrap.html
both=$(header:.html=_both.html)
options=c('skip_style', 'base64_images', 'use_xhtml', 'mathjax')

code_style_chooser=
style_chooser=
standalone=

ifdef style_chooser
	chooser+=knitr_bootstrap_style_toggle.html
	header_temp=$(both)
endif
ifdef code_style_chooser
	chooser+=knitr_bootstrap_code_style_toggle.html
	header_temp=$(both)
endif

ifdef standalone
	chooser_inline=$(chooser:.html=_inline.html)
	header_inline=$(header:.html=_inline.html)
	header:=$(header_inline)
	chooser:=$(chooser_inline)
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
