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
* Automatic table of contents constructed from h1-4 tags using [tocify]
* Images are automatically centered, thumbnailed and lightboxed using [fancybox]
* Style with themes from [bootswatch], optionally including a style switch.
* Code blocks automatically highlighted using [highlight.js], optionally including a style switch.
* Code/Output block and plot visibility can be toggled with a mouse click
  * Globally
  * Per language
* Create completely offline reports, including all css, javascript and images
* Mathematical equations using [mathjax], note this does not work offline

## Examples ##
All the examples include a css style switch, so you can try out the various styles from [bootswatch].

* [2d_3d] - examples of miscellaneous 2d and interactive 3d plots
* [cars] - using ggplot2 and the cars dataset
* [engines] - using other language engines
* [illusions] - examples of interesting optical illusions
* [maps] - examples of map plots, and holding plots until end of the block
* [math] - examples of MathJax formulas
* [all] - All examples together

## Installation ##

[knitrBootstrap] requires the [rstudio/markdown] package (`>= 0.5.5`). You can
install [knitrBootstrap] with the [devtools] package.

```r
library(devtools)
install_github(username='jimhester', repo='knitrBootstrap')
```
## Usage ##

Reports can be built within [R](#Rfunction), a [Makefile](#makefile), by [Rstudio](#rstudio) or with [Vim](#vim).
### R ###
```r
library(knitrBootstrap)
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
    knit_bootstrap(input=inputFile, outfile=outputFile)
  }
)
```

### Vim ###

Using the [Vim-R-Plugin](https://github.com/vim-scripts/Vim-R-plugin) put the following function in your .vimrc to create the file directly with knitr and the markdown package

*Note this requires the latest version of the [rstudio/markdown] R package, see [Usage](#usage)*
```vim
function! RMakeHTML_2()
  update
  call RSetWD()
  let filename = expand("%:r:t")
  let rcmd = "require('knitrBootstrap');
    \knit_bootstrap(" . filename ")"
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
[knitrBootstrap]: https://github.com/jimhester/knitrBootstrap
[fancybox]: http://fancyapps.com/fancybox
[mathjax]: http://mathjax.org
[bootswatch]: http://bootswatch.com

[2d_3d]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/examples/2d_3d.html
[all]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/examples/all.html
[cars]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/examples/cars.html
[engines]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/examples/engines.html
[illusions]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/examples/illusions.html
[maps]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/examples/maps.html
[math]: http://htmlpreview.github.com/?https://github.com/jimhester/knitrBootstrap/blob/master/examples/math.html
