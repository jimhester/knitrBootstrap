# Knitr Bootstrap #
A framework to create bootstrap styled HTML reports from knitr Rmarkdown.

## Table of Contents

* [Features](#features)
* [Examples](#examples)
* [Installation](#installation)
* [Usage](#usage)
  * [R](#Rfunction)
  * [Makefile](#makefile)
  * [RStudio](#rstudio)
  * [Vim](#vim)
  * [Pandoc](#pandoc)
* [Styles](#styles)

## Features ##
* Uses bootstrap 3.0, should work for all screen sizes.
* Automatic table of contents constructed from h1-4 tags using [tocify].
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

```r
install.packages('knitrBootstrap')
```

If you want to install the latest development version use the [devtools] package.
```r
library(devtools)
install_github(username='jimhester', repo='knitrBootstrap')
```
## Usage ##

Reports can be built within [R](#Rfunction), a [Makefile](#makefile), by [RStudio](#rstudio) or with [Vim](#vim).

### R ###
```r
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
make CHOOSER=c('boot') file.html

#with code style chooser
make CHOOSER=c('code') file.html

#with both
make CHOOSER=c('boot', 'code') file.html

#standalone
make file.html
make file_inline.html
```

### RStudio ###

Simply source the following code in RStudio before you knit your reports.
See [http://www.rstudio.com/ide/docs/authoring/markdown_custom_rendering]() for more information.

```r
options(rstudio.markdownToHTML =
  function(inputFile, outputFile) {
    require(knitrBootstrap)
    knit_bootstrap_md(input=inputFile, output=outputFile)
  }
)
```

### Vim ###

Using the [Vim-R-Plugin](https://github.com/vim-scripts/Vim-R-plugin) put the following function in your .vimrc to create the file directly with knitr and the markdown package

```vim
function! RMakeHTML_2()
  update
  call RSetWD()
  let filename = expand("%:r:t")
  let rcmd = "require('knitrBootstrap');
    \knit_bootstrap(\"" . filename . ".Rmd\")"
  if g:vimrplugin_openhtml
    let rcmd = rcmd . '; browseURL("' . filename . '.html")'
  endif
  call SendCmdToR(rcmd)
endfunction

"bind RMakeHTML_2 to leader kk
nnoremap <silent> <Leader>kk :call RMakeHTML_2()<CR>
```

### Pandoc ###
Pandoc can use the same files, but some things do not quite work due to
markdown conversion differences between the markdown package and pandoc.  Use
at your own risk!

If your markdown filename is example.md you can use the header html
```console
pandoc -H knitr_bootstrap.html example.md -o example.html
```

## Styles ##

All of the examples include style toggles for both bootstrap and the code
highlighting.  The knit_bootstrap function has boot_style and code_style
arguments if you want to use an alternative style by default.

[highlight.js]: https://github.com/isagalaev/highlight.js
[tocify]: http://gregfranko.com/jquery.tocify.js
[rstudio/markdown]: https://github.com/rstudio/markdown
[knitrBootstrap]: https://jimhester.github.io/knitrBootstrap
[magnific popup]: http://dimsemenov.com/plugins/magnific-popup
[mathjax]: http://mathjax.org
[bootswatch]: http://bootswatch.com
[devtools]: https://github.com/hadley/devtools

[2d]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/inst/doc/two-D.html
[all]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/inst/examples/all.html
[cars]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/inst/doc/cars.html
[engines]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/inst/examples/engines.html
[illusions]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/inst/doc/illusions.html
[maps]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/inst/doc/maps.html
[math]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/inst/doc/math.html
