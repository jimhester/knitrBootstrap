#TODO make encode windows compatible, will be a pain, need to remove perl dependencies, maybe best as an extension to markdown package rather than here.

#' knit a Rmd file and wrap it in bootstrap styles
#'
#' This function includes the knitrBootstrap html headers to wrap the knitr
#' output in bootstrap styled html.
#'
#' @param input Rmd input file to knit
#' @param output html output file created, if NULL uses the input filename with
#'        the extension changed to .html
#' @param boot_style the bootstrap style to use, if NULL uses the default, if
#'        TRUE a menu is shown with the available styles.
#' @param code_style the highlight.js code style to use, if NULL uses the default, if
#'        TRUE a menu is shown with the available styles.
#' @param chooser if "boot", adds a bootstrap style chooser to the html, if
#'        "code" adds the bootstrap code chooser.
#' @param graphics what graphics to use for the menus, only applicable if
#'        code_style or boot_style are true.
#' @param markdown_options passed to markdownToHTML, defaults to mathjax,
#'        base64_images and use_xhtml.
#' @param text a character vector as an alternative way to provide the input
#'   file
#' @param quiet whether to suppress the progress bar and messages
#' @param envir the environment in which the code chunks are to be evaluated
#'   (can use \code{\link{new.env}()} to guarantee an empty new environment)
#' @param encoding the encoding of the input file; see \code{\link{file}}
#' @param ... options passed to \code{\link[markdown]{markdownToHTML}}
#' @export
#' @seealso \code{\link{knit}}, \code{\link[markdown]{markdownToHTML}}
#' @export
#' @examples
#' writeLines(c("# hello markdown", '```{r hello-random, echo=TRUE}', 'rnorm(5)', '```'), 'test.Rmd')
#' knit_bootstrap('test.Rmd', boot_style='Amelia', code_style='Dark', chooser=c('boot','code'))
#' if(interactive()) browseURL('test.html')
knit_bootstrap =
  function(input, output = NULL, boot_style=NULL, code_style=NULL, chooser=NULL,
           markdown_options=c('mathjax', 'base64_images', 'use_xhtml'),
           ..., envir = parent.frame(), text = NULL,
           quiet = FALSE, encoding = getOption('encoding'), graphics = getOption("menu.graphics")) {
  header = create_header(boot_style, code_style, chooser, graphics)

  require(markdown)
  require(knitr)
  if(is.null(output))
    output <- sub_ext(input, 'html')

  out = knit(input, NULL, text = text, envir = envir, encoding = encoding, quiet = quiet)
  if (is.null(text)) {
    markdown::markdownToHTML(out, header=header, stylesheet='',
      options=markdown_options, output = output, ...)
    invisible(output)
  } else markdown::markdownToHTML(text = out, header=header, stylesheet='',
           options=markdown_options, output = output, ...)
}

style_url="http://netdna.bootstrapcdn.com/bootswatch/2.3.1/$style/bootstrap.min.css"
link_pattern='<link[^\n\r]+rel="stylesheet"[^\n\r]+href="'
default_boot_style='http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css'
default_code_style='http://yandex.st/highlightjs/7.3/styles/default.min.css'

get_style <- function(style, style_type, title, graphics = getOption("menu.graphics")){
  style = if(!is.null(style) && style %in% names(style_type)){
    style_type[style]
  }
  else if(!is.null(style) && style == TRUE){
    style_type[menu(names(style_type), graphics, title)]
  }
  else {
    style_type[1]
  }
  return(style)
}

create_header <-
  function(boot_style=NULL, code_style=NULL, chooser=c('boot', 'code'),
           graphics = getOption("menu.graphics")){

  boot_style=get_style(boot_style, boot_styles, 'Bootstrap Style', graphics)
  code_style=get_style(code_style, code_styles, 'Code Block Style', graphics)

  package_root = system.file(package='knitrBootstrap')
  header = paste(package_root, 'templates/knitr_bootstrap.html', sep='/')

  header_lines = file_lines(header)

  chooser = match.arg(chooser, several.ok=TRUE)
  filenames = if('boot' %in% chooser){
    paste(package_root, 'templates/knitr_bootstrap_style_toggle.html', sep='/')
  }
  filenames = if('code' %in% chooser){
    c(filenames, paste(package_root, 'templates/knitr_bootstrap_code_style_toggle.html', sep='/'))
  }

  output_lines = paste(header_lines, append_files(filenames, outfile), sep='\n')

  #update bootstrap style
  output_lines =
    gsub(paste('(', link_pattern, ')(', default_boot_style, ')', sep=''),
         paste('\\1', boot_style, '"', sep=''), output_lines)

  #update code style
  output_lines =
    gsub(paste('(', link_pattern, ')(', default_code_style, ')', sep=''),
         paste('\\1', code_style, '"', sep=''), output_lines)

  outfile = paste(tempdir(), 'knitr_bootstrap_full.html', sep='/')

  cat(output_lines, '\n', file=outfile)
  outfile
}

append_files <- function(files, output){
  paste(mapply(file_lines, files), collapse='\n')
}

file_lines <- function(file){
  stopifnot(file.exists(file))
  paste(readLines(file), collapse='\n')
}

# substitute extension, from knitr
sans_ext = tools::file_path_sans_ext
sub_ext = function(x, ext) {
  if (grepl('\\.([[:alnum:]]+)$', x)) x = sans_ext(x)
  paste(x, ext, sep = '.')
}

boot_styles = c(
  'Default'='http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css',
  'Amelia'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/amelia/bootstrap.min.css',
  'Cerulean'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cerulean/bootstrap.min.css',
  'Cosmo'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cosmo/bootstrap.min.css',
  'Cyborg'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cyborg/bootstrap.min.css',
  'Journal'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/journal/bootstrap.min.css',
  'Flatly'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/flatly/bootstrap.min.css',
  'Readable'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/readable/bootstrap.min.css',
  'Simplex'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/simplex/bootstrap.min.css',
  'Slate'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/slate/bootstrap.min.css',
  'Spacelab'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/spacelab/bootstrap.min.css',
  'Spruce'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/spruce/bootstrap.min.css',
  'Superhero'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/superhero/bootstrap.min.css',
  'United'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/united/bootstrap.min.css'
)

code_styles = c(
  'Default'='http://yandex.st/highlightjs/7.3/styles/default.min.css',
  'Dark'='http://yandex.st/highlightjs/7.3/styles/dark.min.css',
  'FAR'='http://yandex.st/highlightjs/7.3/styles/far.min.css',
  'IDEA'='http://yandex.st/highlightjs/7.3/styles/idea.min.css',
  'Sunburst'='http://yandex.st/highlightjs/7.3/styles/sunburst.min.css',
  'Zenburn'='http://yandex.st/highlightjs/7.3/styles/zenburn.min.css',
  'Visual Studio'='http://yandex.st/highlightjs/7.3/styles/vs.min.css',
  'Ascetic'='http://yandex.st/highlightjs/7.3/styles/ascetic.min.css',
  'Magula'='http://yandex.st/highlightjs/7.3/styles/magula.min.css',
  'GitHub'='http://yandex.st/highlightjs/7.3/styles/github.min.css',
  'Google Code'='http://yandex.st/highlightjs/7.3/styles/googlecode.min.css',
  'Brown Paper'='http://yandex.st/highlightjs/7.3/styles/brown_paper.min.css',
  'School Book'='http://yandex.st/highlightjs/7.3/styles/school_book.min.css',
  'IR Black'='http://yandex.st/highlightjs/7.3/styles/ir_black.min.css',
  'Solarized - Dark'='http://yandex.st/highlightjs/7.3/styles/solarized_dark.min.css',
  'Solarized - Light'='http://yandex.st/highlightjs/7.3/styles/solarized_light.min.css',
  'Arta'='http://yandex.st/highlightjs/7.3/styles/arta.min.css',
  'Monokai'='http://yandex.st/highlightjs/7.3/styles/monokai.min.css',
  'XCode'='http://yandex.st/highlightjs/7.3/styles/xcode.min.css',
  'Pojoaque'='http://yandex.st/highlightjs/7.3/styles/pojoaque.min.css',
  'Rainbow'='http://yandex.st/highlightjs/7.3/styles/rainbow.min.css',
  'Tomorrow'='http://yandex.st/highlightjs/7.3/styles/tomorrow.min.css',
  'Tomorrow Night'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night.min.css',
  'Tomorrow Night Bright'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-bright.min.css',
  'Tomorrow Night Blue'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-blue.min.css',
  'Tomorrow Night Eighties'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-eighties.min.css'
)
