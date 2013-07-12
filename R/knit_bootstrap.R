#' knit a Rmd file and wrap it in bootstrap styles
#'
#' This function includes the knitrBootstrap HTML headers to wrap the knitr
#' output in bootstrap styled HTML.
#'
#' @inheritParams knit_bootstrap_md
#' @inheritParams bootstrap_HTML
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
           markdown_options=c('mathjax', 'base64_images', 'use_xhtml'),
           ..., envir = parent.frame(), text = NULL,
           quiet = FALSE, encoding = getOption('encoding'),
           graphics = getOption("menu.graphics")) {

  md_file =
    knit(input, NULL, text = text, envir = envir,
         encoding = encoding, quiet = quiet)

  knit_bootstrap_md(md_file, output, boot_style=boot_style,
                    code_style=code_style, chooser=chooser,
                    markdown_options = markdown_options,
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
#' @inheritParams bootstrap_HTML
#' @param markdown_options passed to markdownToHTML, defaults to mathjax,
#'        base64_images and use_xhtml.
#' @param ... options passed to \code{\link[markdown]{markdownToHTML}}
#' @export knit_bootstrap_md
#' @seealso \code{\link{knit_bootstrap}} \code{\link{knit}}, \code{\link[markdown]{markdownToHTML}}

knit_bootstrap_md =
function(input, output = NULL, boot_style=NULL, code_style=NULL, chooser=NULL,
         text = NULL,
         markdown_options=c('mathjax', 'base64_images', 'use_xhtml'),
         graphics = getOption("menu.graphics"), ...) {

  require(knitr)
  header = create_header(boot_style, code_style, chooser, graphics)
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
#' @param boot_style the bootstrap style to use if character, if NULL uses the
#'        default, if TRUE a menu is shown with the available styles.
#' @param code_style the highlight.js code style to use if character, if NULL
#'        uses the defaults, if TRUE a menu is shown with the available styles.
#' @param chooser a character vector, if contains "boot", adds a bootstrap
#'        style chooser to the HTML, if contains "code" adds the bootstrap
#'        code chooser.
#' @param graphics what graphics to use for the menus, only applicable if
#'        code_style or boot_style are true.
#' @export bootstrap_html

bootstrap_HTML = function(input, output = NULL, boot_style=NULL,
                          code_style=NULL, chooser=NULL,
                          graphics = getOption("menu.graphics")) {
  if(is.null(output))
    output <- sub_ext(input, 'html')
  stopifnot(input != output)

  header_lines =
    create_header(boot_style, code_style, chooser, graphics, no_file=TRUE)

  lines = file_lines(input)

  #bit of a hack, check if substitute happened based on string length
  input_length = nchar(lines)

  #add header to file at the end of the header
  lines =
    sub('</head>', paste(escape(header_lines), '</head>', collapse='\n'), lines)

  #add header before the body if no header found
  if(nchar(lines) == input_length)
    lines =
      sub('<body>',
          paste('<head>', escape(header_lines), '</head><body>', collapse='\n')
          , lines)

  cat(lines, '\n', file=output)
  output
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
           graphics = getOption("menu.graphics"), no_file=FALSE){

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
    c(filenames, paste(package_root,
                       'templates/knitr_bootstrap_code_style_toggle.html',
                       sep='/'))
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

  if(no_file)
    return(output_lines)

  outfile = paste(tempdir(), 'knitr_bootstrap_full.html', sep='/')

  cat(output_lines, '\n', file=outfile)
  invisible(outfile)
}

append_files <- function(files, output){
  paste(mapply(file_lines, files), collapse='\n')
}

file_lines <- function(file){
  stopifnot(file.exists(file))
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
