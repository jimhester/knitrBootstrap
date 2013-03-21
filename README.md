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
* Code block visibility can be toggled with a mouse click
* Images can be zoomed and centered by clicking
* Code blocks automatically highlighted using [highlight.js]
* Automatically wraps code block with div elements to work with bootstrap
* Can restyle with bootstrap compatible css

## Examples ##
[cars]

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

### Pandoc ###
if your markdown filename is example.md you can use the header html and css with
```console
pandoc -H knitr_bootstrap.html -c knitr_bootstrap.css example.md -o example.html
```

### Vim ###

If you are using the [Vim-R-Plugin](https://github.com/vim-scripts/Vim-R-plugin) you can put the following function in your .vimrc to create the file directly with knitr and the markdown package

*Note this requires my [patch] to the [rstudio/markdown] R package*
```vim
function! RMakeHTML_2()
  update
  call RSetWD();
  let filename = expand("%:r:t")
  "requires my patch to markdownToHTML
  let rcmd = "require('knitr');knit2html(stylesheet='~/share/knitr_bootstrap.css', header='~/share/knitr_bootstrap.html', '" . filename . ".Rmd', output='" . filename . ".html')"
  if g:vimrplugin_openhtml
      let rcmd = rcmd . '; browseURL("' . filename . '.html")'
  endif
  call SendCmdToR(rcmd)
endfunction

"bind RMakeHTML_2 to leader kk
nnoremap <silent> <Leader>kk :call RMakeHTML_2()<CR>
```

[highlight.js]: https://github.com/isagalaev/highlight.js
[tocify]: http://gregfranko.com/jquery.tocify.js
[patch]: https://github.com/rstudio/markdown/pull/23
[rstudio/markdown]: https://github.com/rstudio/markdown

[cars]: http://htmlpreview.github.com/?https://github.com/jimhester/knitr_bootstrap/blob/master/examples/cars.html
