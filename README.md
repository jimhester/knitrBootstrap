# Knitr Bootstrap #

A framework to create bootstrap styled HTML reports from knitr Rmarkdown.

## Table of Contents

* [Features](#features)
* [Examples](#examples)
* [Usage](#usage)
  * [Makefile](#makefile)
  * [RStudio](#rstudio)
  * [Vim](#vim)
  * [Pandoc](#pandoc)

## Features ##
* Automatic table of contents constructed from h1-4 tags using [tocify]
* Images are automatically centered, thumbnailed and lightboxed using [fancybox]
* Style with themes from [bootswatch], optionally including a style switch.
* Code blocks automatically highlighted using [highlight.js], optionally including a style switch.
* Code/Output block and plot visibility can be toggled with a mouse click
* Create completely offline reports, including all css, javascript and images
* Mathematical equations using [mathjax], note this does not work offline

## Examples ##
All the examples include a css style switch, so you can try out the included styles.

* [2d_3d] - examples of miscellaneous 2d and interactive 3d plots
* [cars] - using ggplot2 and the cars dataset
* [illusions] - examples of interesting optical illusions
* [maps] - examples of map plots, and holding plots until end of the block
* [math] - examples of MathJax formulas
* [all] - All examples together

## Usage ##

Using the [Makefile](#makefile), [Rstudio](#rstudio) or [Vim](#vim) methods of
building the report requires the latest version of the [rstudio/markdown] package.
You can install it using the [devtools] package.

```r
library(devtools)
install_github(username='rstudio', repo='markdown')
```

### Makefile ###

You can use the included Makefile to generate html reports from Rmd files from
the command line.  If you have a file file.Rmd and you want to create file.html use

```bash
#standard
make file.html

#with style chooser
make style_chooser=1 file.html

#with code style chooser
make code_style_chooser=1 file.html

#standalone
make standalone=1 file.html

#with standalone and both style choosers !caution! this will be a several MB file
make standalone=1 style_chooser=1 file.html
```

### RStudio ###

Simply source the following code in RStudio before you knit your reports.
See [http://www.rstudio.com/ide/docs/authoring/markdown_custom_rendering]()

*Note this requires the latest version of the [rstudio/markdown] R package, see [Usage](#usage)*
```r
options(rstudio.markdownToHTML =
  function(inputFile, outputFile) {
    require(markdown)
    markdownToHTML(inputFile, outputFile, 
      header='knitr_bootstrap.html',
      options=c('base64_images', 'mathjax', 'skip_style', 'use_xhtml')
    )
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
  let rcmd = "require('knitr');
        \knit2html(header='~/share/knitr_bootstrap.html', '" .  filename . ".Rmd',
        \output='" . filename . ".html',
        \options=c('base64_images', 'mathjax', 'skip_style', 'use_xhtml'))"
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
conversion differences between the markdown package and pandoc.  Use at your
own risk!

If your markdown filename is example.md you can use the header html
```console
pandoc -H knitr_bootstrap.html -c knitr_bootstrap.css example.md -o example.html
```

[highlight.js]: https://github.com/isagalaev/highlight.js
[tocify]: http://gregfranko.com/jquery.tocify.js
[rstudio/markdown]: https://github.com/rstudio/markdown
[fancybox]: http://fancyapps.com/fancybox
[mathjax]: http://mathjax.org
[bootswatch]: http://bootswatch.com

[2d_3d]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/2d_3d.html
[all]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/all.html
[cars]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/cars.html
[illusions]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/illusions.html
[maps]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/maps.html
[math]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/math.html
