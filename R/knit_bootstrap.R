#' knit a Rmd file and wrap it in bootstrap styles
#'
#' This function includes the knitrBootstrap HTML headers to wrap the knitr
#' output in bootstrap styled HTML.
#'
#' @inheritParams knit_bootstrap_md
#' @inheritParams create_header
#' @param input Rmd input file to knit into HTML
#' @param output HTML output file created, if NULL uses the input filename with
#'        the extension changed to .html
#' @param quiet whether to suppress the progress bar and messages
#' @param envir the environment in which the code chunks are to be evaluated
#'   (can use \code{\link{new.env}()} to guarantee an empty new environment)
#' @param encoding the encoding of the input file; see \code{\link{file}}
#' @seealso \code{\link{knit_bootstrap_md}} \code{\link{knit}}, \code{\link[markdown]{markdownToHTML}}
#' @aliases knit_bootstrap knit_bootstrap_Rmd
#' @export knit_bootstrap knit_bootstrap_Rmd
#' @examples
#' writeLines(c("# hello markdown", '```{r hello-random, echo=TRUE}', 'rnorm(5)', '```'), 'test.Rmd')
#' knit_bootstrap('test.Rmd', boot_style='Amelia', code_style='Dark', chooser=c('boot','code'))
#' if(interactive()) browseURL('test.html')

knit_bootstrap =
  function(input, output = NULL, boot_style=NULL, code_style=NULL, chooser=NULL,
           thumbsize=c('col-md-3','col-md-1','col-md-2','col-md-4','col-md-5','col-md-6','col-md-7','col-md-8','col-md-9'),
           show_code=FALSE, show_output=TRUE, show_figure=TRUE,
           markdown_options=c('mathjax', 'base64_images', 'use_xhtml'),
           ..., envir = parent.frame(), text = NULL,
           quiet = FALSE, encoding = getOption('encoding'),
           graphics = getOption("menu.graphics")) {

  knitr::render_html()
  opts_chunk$set(tidy=FALSE, highlight=FALSE)
  md_file =
    knit(input, NULL, text = text, envir = envir,
         encoding = encoding, quiet = quiet)

  knit_bootstrap_md(md_file, output, boot_style=boot_style,
                    code_style=code_style, chooser=chooser,
                    markdown_options = markdown_options,
                    thumbsize=thumbsize,
                    show_code=show_code, show_output=show_output, show_figure=show_figure,
                    ..., graphics=graphics)
  invisible(output)
}

knit_bootstrap_Rmd = knit_bootstrap

#' knit a md file and wrap it in bootstrap styles
#'
#' This function includes the knitrBootstrap HTML headers to wrap the knitr
#' output in bootstrap styled HTML.
#' @param input md input file to be converted to HTML'
#' @param output HTML output file created, if NULL uses the input filename with
#'        the extension changed to .html
#' @param text a character vector as an alternative way to provide the input
#'   file
#' @inheritParams create_header
#' @param markdown_options passed to markdownToHTML, defaults to mathjax,
#'        base64_images and use_xhtml.
#' @param ... options passed to \code{\link[markdown]{markdownToHTML}}
#' @export knit_bootstrap_md
#' @seealso \code{\link{knit_bootstrap}} \code{\link{knit}}, \code{\link[markdown]{markdownToHTML}}

knit_bootstrap_md =
function(input, output = NULL, boot_style=NULL, code_style=NULL, chooser=NULL,
         text = NULL,
         thumbsize=c('col-md-3','col-md-1','col-md-2','col-md-4','col-md-5','col-md-6','col-md-7','col-md-8','col-md-9'),
         show_code=FALSE, show_output=TRUE, show_figure=TRUE,
         markdown_options=c('mathjax', 'base64_images', 'use_xhtml'),
         graphics = getOption("menu.graphics"), ...) {

  require(knitr)
  header = create_header(boot_style=boot_style, code_style=code_style,
                         chooser=chooser,
                         thumbsize=thumbsize, 
                         show_code=show_code, show_output=show_output, show_figure=show_figure,
                         graphics=graphics)

  require(markdown)
  if(is.null(output))
    output <- sub_ext(input, 'html')

  if (is.null(text)) {
    markdown::markdownToHTML(input, header=header, stylesheet='',
      options=markdown_options, output = output, ...)
  }
  else {
    markdown::markdownToHTML(text = input, header=header, stylesheet='',
           options=markdown_options, output = output, ...)
  }
  invisible(output)
}

#' Add the knitrBootstrap html header to an HTML file produced by knitr.
#'
#' This function includes the knitrBootstrap HTML headers to wrap the knitr
#' output in bootstrap styled HTML.
#' @param input html filename to be wrapped with Bootstrap.
#' @param output html filename to output.
#' @inheritParams create_header
#' @export bootstrap_HTML

bootstrap_HTML = function(input, output = NULL, boot_style=NULL,
                          code_style=NULL, chooser=NULL,
                          thumbsize=c('col-md-3','col-md-1','col-md-2','col-md-4','col-md-5','col-md-6','col-md-7','col-md-8','col-md-9'),
                          show_code=FALSE, show_output=TRUE, show_figure=TRUE,
                          graphics = getOption("menu.graphics")) {
  if(is.null(output))
    output <- sub_ext(input, 'html')
  if(input == output)
    stop('input cannot be the same as output:', input, ' ', output)

  header = create_header(boot_style=boot_style, code_style=code_style,
                         chooser=chooser, thumbsize=thumbsize,
                         show_code=show_code, show_output=show_output, show_figure=show_figure,
                         graphics=graphics, outfile=FALSE)

  lines = read_file(input)

  #bit of a hack, check if substitute happened based on string length
  input_length = nchar(lines)

  #add header to file at the end of the header
  lines =
    sub('</head>', paste(escape(header), '</head>', collapse='\n'), lines)

  #add header before the body if no header found
  if(nchar(lines) == input_length)
    lines =
      sub('<body>',
          paste('<head>', escape(header), '</head><body>', collapse='\n')
          , lines)

  cat(lines, '\n', file=output)
  output
}


style_url="http://netdna.bootstrapcdn.com/bootswatch/2.3.1/$style/bootstrap.min.css"
link_pattern='<link[^\n\r]+rel="stylesheet"[^\n\r]+href='
default_boot_style='http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css'
default_code_style='http://yandex.st/highlightjs/7.3/styles/default.min.css'
nav_pattern='nav = "[^"]+"'
thumb_pattern='thumbsize = "[^"]+"'
show_code_pattern='show_code = [^;]+;'
show_figure_pattern='show_figure = [^;]+;'
show_output_pattern='show_output = [^;]+;'

get_style <- function(style, style_type, title, graphics = getOption("menu.graphics")){
  style = if(is.null(style)){
    style_type[1]
  }
  else if(!is.null(style) && style == TRUE){
    style_type[menu(names(style_type), graphics, title)]
  }
  else {
    style_type[match.arg(tolower(style), names(style_type))]
  }
  return(style)
}

#' Create the html header based on the options given
#' @param boot_style the bootstrap style to use if character, if NULL uses the
#'        default, if TRUE a menu is shown with the available styles.
#' @param code_style the highlight.js code style to use if character, if NULL
#'        uses the defaults, if TRUE a menu is shown with the available styles.
#' @param chooser a character vector, if contains "boot", adds a bootstrap
#'        style chooser to the HTML, if contains "code" adds the bootstrap
#'        code chooser.
#' @param thumbsize size of thumbnails in bootstrap columns.
#' @param show_code show code blocks by default.
#' @param show_output show output blocks by default.
#' @param show_figure show figures by default.
#' @param graphics what graphics to use for the menus, only applicable if
#'        code_style or boot_style are true.
#' @param outfile if NULL, write the output file in a temporary directory, if a
#'        character write it to that location, if FALSE, return the header as a
#'        character.

#' @export create_header

create_header <-
  function(boot_style=NULL, code_style=NULL, chooser=NULL,
           thumbsize=c('col-md-3','col-md-1','col-md-2','col-md-4','col-md-5','col-md-6','col-md-7','col-md-8','col-md-9'),
           show_code=FALSE, show_output=TRUE, show_figure=TRUE,
           graphics = getOption("menu.graphics"), outfile=NULL){

  boot_style=get_style(boot_style, boot_styles, 'Bootstrap Style', graphics)
  code_style=get_style(code_style, code_styles, 'Code Block Style', graphics)

  includes = read_package_file('templates/knitr_bootstrap_includes.html')
  javascript = read_package_file('templates/knitr_bootstrap.js')
  css = read_package_file('templates/knitr_bootstrap.css')

  chooser = match.arg(chooser, choices=c(NA, 'boot', 'code'), several.ok=TRUE)
  boot_toggle = if('boot' %in% chooser){
    read_package_file('templates/knitr_bootstrap_style_toggle.html')
  }
  code_toggle = if('code' %in% chooser){
    read_package_file('templates/knitr_bootstrap_code_style_toggle.html')
  }

  thumbsize=match.arg(thumbsize)
  javascript = sub(thumb_pattern, paste('thumbsize = "', thumbsize, '"', sep=''), javascript)

  if(is.logical(show_code))
    javascript = sub(show_code_pattern, paste('show_code = ', ifelse(show_code,
                                                                     'true',
                                                                     'false'),
                                              ';'), javascript)

  if(is.logical(show_output))
    javascript = sub(show_output_pattern, paste('show_output = ', ifelse(show_output,
                                                                     'true',
                                                                     'false'),
                                              ';'), javascript)

  if(is.logical(show_figure))
    javascript = sub(show_figure_pattern, paste('show_figure = ', ifelse(show_figure,
                                                                     'true',
                                                                     'false'),
                                              ';'), javascript)

  output = paste(includes,
                 '<script>', javascript, '</script>',
                 '<style>', css, '</style>',
                 boot_toggle,
                 code_toggle,
                 sep='\n')

  #update bootstrap style
  output =
    gsub(paste('(', link_pattern, ')("', default_boot_style, ')"', sep=''),
         paste('\\1', boot_style, sep=''), output)

  #update code style
  output =
    gsub(paste('(', link_pattern, ')"(', default_code_style, ')"', sep=''),
         paste('\\1', '"', code_style, '"', sep=''), output)

  if(is.logical(outfile) && outfile == FALSE)
    return(output)

  if(is.null(outfile))
    outfile = paste(tempdir(), 'knitr_bootstrap_full.html', sep='/')

  cat(output, '\n', file=outfile)
  invisible(outfile)
}

append_files <- function(files){
  paste(mapply(read_package_file, files), collapse='\n')
}

read_package_file <- function(path){
  location = paste(system.file(package='knitrBootstrap'), path, sep='/')
  read_file(location)
}

read_file <- function(file){
  if(!file.exists(file))
    stop('file: ', file, ' does not exist')
  readChar(file, 10e6)
}

# substitute extension, from knitr
sans_ext = tools::file_path_sans_ext
sub_ext = function(x, ext) {
  if (grepl('\\.([[:alnum:]]+)$', x)) x = sans_ext(x)
  paste(x, ext, sep = '.')
}

#escape already escape strings
escape = function(string) gsub("([\"$`\\])", "\\\\\\1", string)

boot_styles = c(
  'default'='http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css',
  'amelia'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/amelia/bootstrap.min.css',
  'cerulean'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cerulean/bootstrap.min.css',
  'cosmo'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cosmo/bootstrap.min.css',
  'cyborg'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cyborg/bootstrap.min.css',
  'journal'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/journal/bootstrap.min.css',
  'flatly'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/flatly/bootstrap.min.css',
  'readable'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/readable/bootstrap.min.css',
  'simplex'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/simplex/bootstrap.min.css',
  'slate'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/slate/bootstrap.min.css',
  'spacelab'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/spacelab/bootstrap.min.css',
  'spruce'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/spruce/bootstrap.min.css',
  'superhero'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/superhero/bootstrap.min.css',
  'united'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/united/bootstrap.min.css'
)

code_styles = c(
  'default'='http://yandex.st/highlightjs/7.3/styles/default.min.css',
  'dark'='http://yandex.st/highlightjs/7.3/styles/dark.min.css',
  'far'='http://yandex.st/highlightjs/7.3/styles/far.min.css',
  'idea'='http://yandex.st/highlightjs/7.3/styles/idea.min.css',
  'sunburst'='http://yandex.st/highlightjs/7.3/styles/sunburst.min.css',
  'zenburn'='http://yandex.st/highlightjs/7.3/styles/zenburn.min.css',
  'visual studio'='http://yandex.st/highlightjs/7.3/styles/vs.min.css',
  'ascetic'='http://yandex.st/highlightjs/7.3/styles/ascetic.min.css',
  'magula'='http://yandex.st/highlightjs/7.3/styles/magula.min.css',
  'github'='http://yandex.st/highlightjs/7.3/styles/github.min.css',
  'google code'='http://yandex.st/highlightjs/7.3/styles/googlecode.min.css',
  'brown paper'='http://yandex.st/highlightjs/7.3/styles/brown_paper.min.css',
  'school book'='http://yandex.st/highlightjs/7.3/styles/school_book.min.css',
  'ir black'='http://yandex.st/highlightjs/7.3/styles/ir_black.min.css',
  'solarized - dark'='http://yandex.st/highlightjs/7.3/styles/solarized_dark.min.css',
  'solarized - light'='http://yandex.st/highlightjs/7.3/styles/solarized_light.min.css',
  'arta'='http://yandex.st/highlightjs/7.3/styles/arta.min.css',
  'monokai'='http://yandex.st/highlightjs/7.3/styles/monokai.min.css',
  'xcode'='http://yandex.st/highlightjs/7.3/styles/xcode.min.css',
  'pojoaque'='http://yandex.st/highlightjs/7.3/styles/pojoaque.min.css',
  'rainbow'='http://yandex.st/highlightjs/7.3/styles/rainbow.min.css',
  'tomorrow'='http://yandex.st/highlightjs/7.3/styles/tomorrow.min.css',
  'tomorrow night'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night.min.css',
  'tomorrow night bright'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-bright.min.css',
  'tomorrow night blue'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-blue.min.css',
  'tomorrow night eighties'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-eighties.min.css'
)
