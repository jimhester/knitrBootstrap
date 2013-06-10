rmd=$(wildcard *.Rmd)
html=$(rmd:.Rmd=.html)

stylesheet=
TEMPLATE=../templates/
header=$(TEMPLATE)knitr_bootstrap.html
both=$(header:.html=_both.html)
options=c('skip_style', 'base64_images', 'use_xhtml', 'mathjax')

R_HOME=/usr/lib64/R

code_style_chooser=1
style_chooser=1
standalone=

ifdef style_chooser
	chooser+=$(TEMPLATE)knitr_bootstrap_style_toggle.html
	header_temp=$(both)
endif
ifdef code_style_chooser
	chooser+=$(TEMPLATE)knitr_bootstrap_code_style_toggle.html
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
	exec/encode.pl $< > $@

%.html: %.Rmd $(stylesheet) $(header_temp)
	$(R_HOME)/bin/Rscript -e "if (getRversion() < '3.0.0') { library(knitr); knit2html(stylesheet='$(stylesheet)', header='$(header)', options=$(options), '$*.Rmd') }"

clean:
	rm -f *.md *.tex $(chooser_inline) $(both) $(header_inline)
