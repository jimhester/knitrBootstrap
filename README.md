# Knitr Bootstrap #
A framework to create bootstrap styled HTML reports from knitr Rmarkdown.

## Table of Contents

* [Features](#features)
* [Examples](#examples)
* [Installation](#installation)
* [Options](#options)
* [Usage](#usage)
  * [R](#Rfunction)
  * [Makefile](#makefile)
  * [RStudio](#rstudio)
  * [Vim](#vim)
  * [Pandoc](#pandoc)
* [Styles](#styles)

## Features ##
* Uses bootstrap 3.0, should work for all screen sizes.
* Automatic table of contents constructed from h1-4 tags.
* Images are automatically centered, thumbnailed and lightboxed using [magnific popup].
* Style with themes from [bootswatch], optionally including a dynamic style switch.
* Code blocks automatically highlighted using [highlight.js], optionally including a dynamic style switch.
* Code/Output block and plot visibility can be toggled with a mouse click
  * Globally
  * Per language
* Create completely offline reports, including all css, javascript and images
* Mathematical equations using [mathjax], note this does not work offline

## Examples ##
All the examples include a css style switch, so you can try out the various styles from [bootswatch].

* [2d] - examples of miscellaneous 2d
* [cars] - using ggplot2 and the cars dataset
* [engines] - using other language engines
* [illusions] - examples of interesting optical illusions
* [maps] - examples of map plots, and holding plots until end of the block
* [math] - examples of MathJax formulas
* [all] - All examples together

## Installation ##
You can install the latest released version from CRAN.

```s
install.packages('knitrBootstrap')
```

If you want to install the latest development version use the [devtools] package.
```s
library(devtools)
install_github('jimhester/knitrBootstrap')
```
## Options ##

Knitr bootstrap extends knitr with a number of additional options.  See [Knitr
Options](http://http://yihui.name/knitr/options) for more about how to set the
two different types of options.

### Package Options ###
 - bootstrap.title - (NULL) Set the title for the html document
 - bootstrap.theme.chooser - (FALSE) - Add a bootstrap style chooser to the page.
 - bootstrap.highlight.chooser - (FALSE) - Add a code style chooser to the page.
 - bootstrap.theme - (Default) - Set the default bootstrap style.
 - bootstrap.highlight - (Default) - Set the default code style.

### Chunk Options ###
 - bootstrap.thumbnail - (TRUE) - Thumbnail and lightbox images.
 - bootstrap.thumbnail.size - ('col-md-6') - Thumbnail size in bootstrap columns. (There are 12 total columns, so 6 would be 50% of the layout width)
 - bootstrap.panel - (FALSE) - Use panels rather than buttons to toggle blocks.
 - bootstrap.hide - (FALSE) - Code and Output from this chunk starts as hidden.
 - bootstrap.show.code - (TRUE) - Code from this chunk starts as shown.
 - bootstrap.show.output - (TRUE) - Output from this chunk starts as shown.
 - bootstrap.theme - (TRUE) - Output from this chunk starts as shown.

## Usage ##

Knitr Bootstrap includes a `knitrBootstrap::bootstrap_document` custom
rendering function for use with the
[Rmarkdown](http://http://rmarkdown.rstudio.com/) package.

### Render Function ###
```s
library(knitrBootstrap)
library(rmarkdown)
render('file.Rmd', knitrBootstrap::bootstrap_document)
```

### YAML frontmatter ###
You can also specify the bootstrap_document function as an output type along
with the options in the YAML front-matter directly in your Rmd file.
```s
---
title: "Test file"
output: knitrBootstrap::bootstrap_document
---
```

Reports can be built within [R](#Rfunction), a [Makefile](#makefile), by [RStudio](#rstudio) or with [Vim](#vim).

### R ###
```s
library(knitrBootstrap)
#defaults only
knit_bootstrap('file.Rmd')
```

### Makefile ###

You can use the included Makefile to generate html reports from Rmd files from
the command line.  If you have a file file.Rmd and you want to create file.html use

```bash
#standard
make file.html

#with bootstrap style chooser
THEME_CHOOSER=TRUE
HIGHLIGHT_CHOOSER=TRUE
make THEME_CHOOSER=TRUE file.html

#with code style chooser
make HIGHLIGHT_CHOOSER=TRUE file.html

#with both
make HIGHLIGHT_CHOOSER=TRUE THEME_CHOOSER=TRUE file.html

#standalone
make file_inline.html
```

### RStudio ###
Very current versions of RStudio use the `render` function when you press the
"Knit" button.  In order to output using knitrBootstrap use the
[YAML front-matter](#yaml-frontmatter) in your document.

### Vim ###
Using the [Vim-R-Plugin](https://github.com/vim-scripts/Vim-R-plugin) put the
following function in your .vimrc to create the file directly with knitr and
the markdown package

```vim
function! RMakeHTML_2()
  update
  call RSetWD()
  let filename = expand("%:r:t")
  let rcmd = "require('knitrBootstrap');\
    render(\"" . filename . ".Rmd\", knitrBootstrap::bootstrap_document)"
  if g:vimrplugin_openhtml
    let rcmd = rcmd . '; browseURL("' . filename . '.html")'
  endif
  call g:SendCmdToR(rcmd)
endfunction

"bind RMakeHTML_2 to leader kk
nnoremap <silent> <Leader>kk :call RMakeHTML_2()<CR>
```

[highlight.js]: https://github.com/isagalaev/highlight.js
[rstudio/markdown]: https://github.com/rstudio/markdown
[knitrBootstrap]: https://jimhester.github.io/knitrBootstrap
[magnific popup]: http://dimsemenov.com/plugins/magnific-popup
[mathjax]: http://mathjax.org
[bootswatch]: http://bootswatch.com
[devtools]: https://github.com/hadley/devtools

[2d]: http://rawgithub.com/jimhester/knitrBootstrap/master/vignettes/two-D.html
[all]: http://rawgithub.com/jimhester/knitrBootstrap/master/inst/examples/all.html
[cars]: http://rawgithub.com/jimhester/knitrBootstrap/master/vignettes/cars.html
[engines]: http://rawgithub.com/jimhester/knitrBootstrap/master/inst/examples/engines.html
[illusions]: http://rawgithub.com/jimhester/knitrBootstrap/master/vignettes/illusions.html
[maps]: http://rawgithub.com/jimhester/knitrBootstrap/master/vignettes/maps.html
[math]: http://rawgithub.com/jimhester/knitrBootstrap/master/vignettes/math.html
