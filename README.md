# Knitr Bootstrap #

A collection of files to create standalone bootstrap html reports from knitr markdown.

## Table of Contents

* [Features](#features)
* [Examples](#examples)
* [Installation](#installation)
  * [RStudio](#rstudio)
  * [Pandoc](#pandoc)
  * [Vim](#vim)

## Features ##
* Automatic table of contents constructed from h1-4 tags using [tocify]
* Output automatically resized to fit the display
* Code/Output block and plot visibility can be toggled with a mouse click
* Images are automatically thumbnailed and lightboxed using [fancybox]
* Code blocks automatically highlighted using [highlight.js]
* Automatically wraps code block with div elements to work with bootstrap
* Can restyle with bootstrap compatible css
* Completely offline report usiing knitr_bootstrap_standalone.html

## Examples ##

* [cars] - using ggplot2 and the cars dataset
* [2d_3d] - examples of miscellaneous 2d and interactive 3d plots
* [maps] - examples of map plots, and holding plots until end of the block

## Installation ##

### RStudio ###

Simply source the following code in RStudio before you knit your reports.
See [http://www.rstudio.com/ide/docs/authoring/markdown_custom_rendering]()

*Note this requires my [patch] to the [rstudio/markdown] R package*
```r
options(rstudio.markdownToHTML =
  function(inputFile, outputFile) {
    require(markdown)
    markdownToHTML(inputFile, outputFile, stylesheet='knitr_bootstrap.css', header='knitr_bootstrap.html')
  }
)
```

### Vim ###

Using the [Vim-R-Plugin](https://github.com/vim-scripts/Vim-R-plugin) put the following function in your .vimrc to create the file directly with knitr and the markdown package

*Note this requires my [patch] to the [rstudio/markdown] R package*
```vim
function! RMakeHTML_2()
  update
  call RSetWD();
  let filename = expand("%:r:t")
  "requires my patch to markdownToHTML
  let rcmd = "require('knitr');knit2html(stylesheet='~/share/knitr_bootstrap.css', header='~/share/knitr_bootstrap.html', '" . filename . ".Rmd', output='" . filename . ".html', options=c('skip_style', 'base64_images', 'use_xhtml'))"
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
[patch]: https://github.com/rstudio/markdown/pull/23
[rstudio/markdown]: https://github.com/rstudio/markdown
[fancybox]: http://fancyapps.com/fancybox

[2d_3d]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/2d_3d.html
[cars]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/cars.html
[maps]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/maps.html
