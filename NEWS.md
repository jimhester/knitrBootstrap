# knitrBootstrap 0.9.0

## Features
  - Remove tocify dependency, as there were outstanding bugs, and it only took
    about 30 lines of code to replace.
  - Move vignettes to vignettes/ from inst/doc

## Fixes
  - #22 Images removed by javascript when echo=FALSE
  - #21 rCharts and knitrBootstrap interaction via results="asis" breaks menu and code toggling
  - #20 show_code=FALSE has different behavior in knit_boostrap() vs knit_bootstrap_md() [broken here]
  - #16 HTML output broken when served over HTTPS

# knitrBootstrap 0.8.0

## Features

  - Migrate to using Bootstrap 3
  - Remove meny option to style, it did not work well on tablets and phones.
  - Code blocks now in panels
  - Output in panels and split by output type (error, message, normal)
  - Automatically uses render_html and highlight=FALSE, so it does not need to be included.
  - Current style chosen is selected.

## Fixes

  - Fix for clicking on default style resets both the code and bootstrap style.
  - Fix for as.is html tables, not putting them in output blocks.

# knitrBootstrap 0.7.0

## Features
  - use magnific popup to do lightboxes rather than fancybox.
  - option to use offscreen or onscreen table of contents navigation.
  - option to set thumbnail size.
  - option to show/hide code blocks by default.

## Fixes
  Make knitr and R dependencies explicit

# knitrBootstrap 0.6.5

- implement boostrap_html to apply the html header to any arbitrary html file.

# knitrBootstrap 0.6.1

- split knit_bootstrap into two functions, knit_bootstrap_Rmd and
  knit_bootstrap_md, to put the bootstrap styles around a R markdown and
  knitted markdown file respectively.  This allows knit_bootstrap_md to be used as
  a drop in replacement for markdownToHTML.  Previous behavior of
  knit_bootstrap function is unchanged.

- fix #9, wrong url in DESCRIPTION

# knitrBootstrap 0.6

- Use meny to style the table of contents
- change to using package layout so framework can be bundled as an R package.

- implement knit_bootstrap function so external makefiles are no longer
  necessary to change styles or include the style choosers.

- fix pre code issue with render_markdown in newer versions of knitr
