#' \pkg{knitrBootstrap} A framework to create Bootstrap 3 HTML reports from knitr
#'   Rmarkdown and RHTML.
#' See \code{\link{knit_bootstrap}} for the common usage.
#' If you are using RStudio, see the second example
#' @examples
#' \dontrun{
#' #defaults only
#' knit_bootstrap('file.Rmd')
#' #Rstudio
#' #you also have to put render_html() in your rmd setup file, then use the
#' below code and the knit button 
#' options(rstudio.markdownToHTML =
#'  function(inputFile, outputFile) {
#'    require(knitrBootstrap)
#'    knit_bootstrap_md(input=inputFile, output=outputFile)
#'  }
#' )
#' }
#' @import knitr markdown
#' @name primerTree
#' @docType package
NULL

panel_types = c('source' = 'panel-primary',
                 'output' = 'panel-success',
                 'message' = 'panel-info',
                 'warning' = 'panel-warning',
                 'error' = 'panel-danger')

button_types = c('source' = 'btn-primary',
                 'output' = 'btn-success',
                 'message' = 'btn-info',
                 'warning' = 'btn-warning',
                 'error' = 'btn-danger')

generate_attribute = function(index, data){
  paste0(names(data)[index], '="', paste0(data[[index]], collapse=' '), '"')
}
print_attributes = function(attributes){
  paste0(vapply(seq_along(attributes), FUN.VALUE=character(1),
                FUN=generate_attribute, USE.NAMES=FALSE, attributes), collapse= ' ')

}
generate_tag_function = function(tag) function(...) tag(tag, list(...)) 
tags = list(
            a = function(...) tag("a", list(...)),
            b = function(...) tag("b", list(...)),
            button = function(...) tag("button", list(...)),
            code = function(...) tag("code", list(...)),
            div = function(...) tag("div", list(...)),
            img = function(...) tag("img", list(...)),
            li = function(...) tag("li", list(...)),
            p = function(...) tag("p", list(...)),
            pre = function(...) tag("pre", list(...)),
            span = function(...) tag("span", list(...)),
            ul = function(...) tag("ul", list(...)),
            h5 = function(...) tag('h5', list(...)),
            link = function(...) tag('link', list(...))
            )
tag = function(type, arg_list){
  named_idx = nzchar(names(arg_list))
  named_idx = if(length(named_idx) == 0) FALSE else named_idx
  paste0('<', type, ' ', print_attributes(arg_list[named_idx]), '>',
         paste0(unlist(arg_list[!named_idx]), collapse='\n'), '</', type,'>')
}
bootstrap_chunk_hook = function(x, options){
  if (knitr:::output_asis(x, options))
    return(x)
  tags$div(class=c('row'), x)
}

`%n%` = function(x, y) if(is.null(x)) y else x

bootstrap_plot_hook = function(x, options) {
  fig = knitr:::.img.tag(knitr:::.upload.url(x), options$out.width, options$out.height,
                         knitr:::.img.cap(options), paste(c(options$out.extra, "class=\"plot\""),
                                                          collapse = " "))
  thumbnail = options$bootstrap.thumbnail = options$bootstrap.thumbnail %n% TRUE
  if(!thumbnail){
    return(tags$div(class=c('row', 'text-center'), fig))
  }
  fig = tags$a(href='#', class='thumbnail', fig)
  if(options$fig.show == 'hold'){
  tags$div(class=c('col-xs-12', 'col-md-6'),
      fig
      )
  }
  else{ #only one figure from this code block so center it
    tags$div(class=c('row'),
      tags$div(class=c('col-xs-12', 'col-md-offset-3', 'col-md-6'),
               fig
               )
      )
  }
}

language_link = function(language){
  tags$li(
          tags$a(
                 href="#",
                 class=c("toggle-global", "source", language),
                 type=c(paste(sep=".", "source", language)),
                 language
                 )
          )
}
output_link = function(type){
  tags$li(
          tags$a(
                 href="#",
                 class=c("toggle-global",type),
                 type=type,
                 type
                 )
          )
}

output_toggle_menu = function(types){
  if(length(types) == 0){
    return('')
  }
  tags$li(class=c("dropup"),
          tags$a(href=c("#"), class="dropdown-toggle", "data-toggle"="dropdown",
                 "Output", tags$b(class = "caret")) ,
          tags$ul(class=c("dropdown-menu"),
                  tags$li(class=c("dropdown-header"), "Type"),
                  paste0(collapse="\n", lapply(types, output_link)),
                  tags$li(tags$a(href="#", type="all-output", class="toggle-global", "All"))
                  )
          )
}

source_toggle_menu = function(languages){
  if(is.null(languages) || length(languages) == 0){
    return('')
  }
  tags$li(class=c("dropup"),
          tags$a(href=c("#"),
                 class="dropdown-toggle",
                 "data-toggle"="dropdown",
                 "Code ", tags$b(class="caret")),
          tags$ul(class=c("dropdown-menu"),
                  tags$li(class=c("dropdown-header"), "Languages"),
                  paste0(collapse="\n", lapply(languages, language_link)),
                  tags$li(tags$a(href="#", type="all-source", class="toggle-global", "All"))
                  )
          )
}

toggle_menu = function(languages, types){
  style_chooser = knitr::opts_knit$get('bootstrap.style.chooser') %n% FALSE
  code_style_chooser = knitr::opts_knit$get('bootstrap.code.style.chooser') %n% FALSE
  paste0(collapse='\n',
         tags$div(class=c("navbar navbar-fixed-bottom navbar-inverse"),
                  tags$div(class=c("container"),
                           tags$div(class=c("navbar-header"),
                                    tags$button(type=c("button"),
                                                class="navbar-toggle",
                                                "data-toggle"="collapse",
                                                "data-target"=".navbar-responsive-collapse",
                                                tags$span(class=c("icon-bar")),
                                                tags$span(class=c("icon-bar")),
                                                tags$span(class=c("icon-bar"))
                                                )
                                    ),
                           tags$div(id="bottom-navbar",
                                    class=c("navbar-collapse", "collapse",
                                            "navbar-responsive-collapse"),
                                    tags$ul(class=c("nav navbar-nav navbar-right"),
                                            tags$li(class=c("nav"),
                                                    tags$p(class="navbar-text", "Toggle")),
                                            source_toggle_menu(languages),
                                            output_toggle_menu(types),
                                            tags$li(tags$a(href="#", class="toggle-figure", "Figures"))
                                            ),
                                    if(style_chooser) generate_style_toggle('Bootstrap Styles', 'style-switch', names(boot_styles)),
                                    if(code_style_chooser) generate_style_toggle('Code Styles', 'code-style-switch', names(code_styles))
                                    )
                           )
                  )
         ,if(style_chooser) generate_style_links(boot_styles)
         ,if(code_style_chooser) generate_style_links(code_styles)
         )
}
generate_style_class = function(class, type){
  tags$li(tags$a(class=type, title=class, href='#', class))
}
generate_style_links = function(data){
  paste0(collapse='\n',
         lapply(names(data),
                function(class){
                  tags$link(rel='alternate stylesheet', type='text/css', href=data[class], title=class, media='screen')
                }))
}
generate_style_toggle = function(title, type, values) {
  tags$ul(class='nav navbar-nav navbar-left',
          tags$li(class=c("dropup"),
                  tags$a(href=c("#"),
                         class="dropdown-toggle",
                         "data-toggle"="dropdown",
                         paste(title, " ", tags$b(class="caret"))),
                  tags$ul(class=c("dropdown-menu"),
                          lapply(values, generate_style_class, type=type)
                          )
                  )
          )
}
generate_button = function(engine, name, x, hide){
  glyph = if(hide) 'glyphicon-chevron-up' else 'glyphicon-chevron-down'
  hidden = if(hide) 'display:none' else ''
  text = paste(tags$span(class=c('glyphicon', glyph)), engine, name)
  paste0(
         tags$button(class=c(name, engine, 'toggle', 'btn', 'btn-xs', button_types[name]), text),
         tags$pre(style=hidden, tags$code(class=c(name, tolower(engine)), x))
         )
}
generate_panel = function(engine, name, x, hide){
  glyph = if(hide) 'glyphicon-chevron-up' else 'glyphicon-chevron-down'
  hidden = if(hide) 'display:none' else ''
  text = tags$h5(class='panel-title', tags$span(class=c('glyphicon', glyph)), paste("", engine, name))
  tags$div(class=c('panel', panel_types[name]),
           tags$div(class=c(name, engine, 'panel-heading', 'toggle'), text),
           tags$pre(style=hidden, tags$code(class=c(name, tolower(engine)), x))
           )
}

render_bootstrap = function() {
  knit_hooks$restore()
  knitr:::set_html_dev()
  knitr::opts_knit$set(out.format = "html")
  knit_hooks$set(render_bootstrap_hooks())
}
render_bootstrap_hooks = function() {
  languages = list()
  types = list()
  html.hook = function(name) {
    force(name)
    function(x, options) {
      x = paste(x, collapse = "\n")
      engine = options$engine
      languages[engine]<<-1
      types[name]<<-1
      button_or_panel = options
      panel = options$bootstrap.panel = options$bootstrap.panel %n% FALSE
      hide = options$bootstrap.hide = options$bootstrap.hide %n% FALSE
      if(panel) generate_panel(engine, name, x, hide) else generate_button(engine, name, x, hide)
    }
  }
  h = knitr::opts_knit$get("header")
  z = list()
  for (i in c("source", "warning", "message", "error")) z[[i]] = html.hook(i)
  c(z,
    list(
       'inline' = function(x) {
         if (inherits(x, "AsIs")) .inline.hook(format_sci(x, "html")) else tags$code(.inline.hook(format_sci(x, "html")))
       },
       'output' = html.hook("output"),
       'plot' = bootstrap_plot_hook,
       'chunk' = bootstrap_chunk_hook,
       'document' = generate_document_hook(languages, types)
    )
  )
}

generate_document_hook = function(languages, types) {
  function(x, options) {
    match = m(x[1],'(?s)^([%].*?\n)([^%\n].*)')
    before = if(match[[1]] != FALSE){
      x[1] = match[[2]]
      match[[1]]
    }
    else {
      ''
    }
    paste0(collapse='\n',
           before,
           tags$div(id="wrap",
                    tags$div(class="container",
                             tags$div(class="row",
                                      tags$div(class=c("contents", "col-md-10"), x)
                                      )
                             ),
                    toggle_menu(names(languages), names(types)[ names(types) != 'source' ])
                    ),
           #footer
           tags$div(id='push'),
           tags$div(id='footer', generate_footer())
           )
  }
}

bootstrap_pandoc_options = paste0('markdown',
                                  "-hard_line_breaks",
                                  "+superscript",
                                  "+tex_math_dollars",
                                  "+raw_html",
                                  "+markdown_in_html_blocks",
                                  #"+pandoc_title_block",
                                  "-implicit_figures", collapse="")

bootstrap_document = function(self_contained=TRUE, ...){
  print(list(...))
  print(self_contained)
  library(rmarkdown)
  header = create_header()
  output_format(knitr = knitr_options(
                                      opts_knit=list('upload.fun' = knitr::image_uri),
                                      opts_chunk = list(dev = 'png'),
                                      knit_hooks=render_bootstrap_hooks()),
                pandoc = pandoc_options(to = "html",
                                        from = bootstrap_pandoc_options,
                                        args=list(H=header)), #self contained breaks on bootswatch css //urls, if(self_contained) '--self-contained' else '')), 
                clean_supporting=self_contained)
}
generate_footer = function(){
  tags$div(class=c("container"),
           tags$p(class=c("text-muted"), id="credit", "Styled with ",
                  tags$a( href='https://github.com/jimhester/knitrBootstrap', "knitrBootstrap")
                  )
           )
}
boot_styles = c(
                'Default'='https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css',
                'Amelia'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/amelia/bootstrap.min.css',
                'Cerulean'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/cerulean/bootstrap.min.css',
                'Cosmo'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/cosmo/bootstrap.min.css',
                'Cyborg'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/cyborg/bootstrap.min.css',
                'Journal'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/journal/bootstrap.min.css',
                'Flatly'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css',
                'Readable'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/readable/bootstrap.min.css',
                'Simplex'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/simplex/bootstrap.min.css',
                'Slate'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/slate/bootstrap.min.css',
                'Spacelab'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/spacelab/bootstrap.min.css',
                'United'='https://netdna.bootstrapcdn.com/bootswatch/3.0.0/united/bootstrap.min.css'
                )

code_styles = c(
                'HighlightJs'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/default.min.css',
                'Dark'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/dark.min.css',
                'Far'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/far.min.css',
                'Idea'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/idea.min.css',
                'Sunburst'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/sunburst.min.css',
                'Zenburn'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/zenburn.min.css',
                'Visual Studio'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/vs.min.css',
                'Ascetic'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/ascetic.min.css',
                'Magula'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/magula.min.css',
                'Github'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/github.min.css',
                'Google Code'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/googlecode.min.css',
                'Brown Paper'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/brown_paper.min.css',
                'School Book'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/school_book.min.css',
                'IR Black'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/ir_black.min.css',
                'Solarized - Dark'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/solarized_dark.min.css',
                'Solarized - Light'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/solarized_light.min.css',
                'Arta'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/arta.min.css',
                'Monokai'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/monokai.min.css',
                'Xcode'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/xcode.min.css',
                'Pojoaque'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/pojoaque.min.css',
                'Rainbow'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/rainbow.min.css',
                'Tomorrow'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/tomorrow.min.css',
                'Tomorrow Night'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/tomorrow-night.min.css',
                'Tomorrow Night Bright'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/tomorrow-night-bright.min.css',
                'Tomorrow Night Blue'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/tomorrow-night-blue.min.css',
                'Tomorrow Night Eighties'='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/tomorrow-night-eighties.min.css'
                )
# note this only works for links with href as the first param
link_pattern='<link\\s+href='
default_boot_style=boot_styles[1]
default_code_style=code_styles[1]
nav_pattern='nav = "[^"]+"'
thumb_pattern='thumbsize = "[^"]+"'
show_code_pattern='show_code = [^;]+'
show_figure_pattern='show_figure = [^;]+'
show_output_pattern='show_output = [^;]+'


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
#' @export
#' @examples
#' writeLines(c("# hello markdown", '```{r hello-random, echo=TRUE}', 'rnorm(5)', '```'), 'test.Rmd')
#' knit_bootstrap('test.Rmd', boot_style='Amelia', code_style='Dark', chooser=c('boot','code'))
#' if(interactive()) browseURL('test.html')

knit_bootstrap =
function(input, output = NULL, boot_style=NULL, code_style=NULL, chooser=NULL,
         thumbsize=3, show_code=FALSE, show_output=TRUE, show_figure=TRUE,
         markdown_options=c('mathjax', 'base64_images', 'use_xhtml'),
         ..., envir = parent.frame(), text = NULL,
         quiet = FALSE, encoding = getOption('encoding'),
         graphics = getOption("menu.graphics")) {

  render_bootstrap()
  opts_chunk$set(tidy=FALSE, highlight=FALSE)
  md_file = knit(input, NULL, text = text, envir = envir,
                 encoding = encoding, quiet = quiet)

  knit_bootstrap_md(md_file, output, boot_style=boot_style,
                    code_style=code_style, chooser=chooser,
                    markdown_options = markdown_options,
                    thumbsize=thumbsize,
                    show_code=show_code, show_output=show_output,
                    show_figure=show_figure, ..., graphics=graphics)
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
#' @inheritParams create_header
#' @param markdown_options passed to markdownToHTML, defaults to mathjax,
#'        base64_images and use_xhtml.
#' @param ... options passed to \code{\link[markdown]{markdownToHTML}}
#' @seealso \code{\link{knit_bootstrap}} \code{\link{knit}},
#'          \code{\link[markdown]{markdownToHTML}}
#' @export

knit_bootstrap_md =
function(input, output = NULL, boot_style=NULL, code_style=NULL, chooser=NULL,
         thumbsize=3, show_code=FALSE,
         show_output=TRUE, show_figure=TRUE,
         markdown_options=c('mathjax', 'base64_images', 'use_xhtml'),
         graphics = getOption("menu.graphics"), ...) {

  header = create_header(boot_style=boot_style, code_style=code_style,
                         chooser=chooser,
                         thumbsize=thumbsize,
                         show_code=show_code, show_output=show_output,
                         show_figure=show_figure, graphics=graphics)

  if(is.null(output))
    output <- sub_ext(input, 'html')

  pandoc(input, output, header)
  invisible(output)
}

pandoc <- function(input=NULL, output, header, text=NULL) {
  if (Sys.which("pandoc") == "")
    stop("Please install pandoc first: http://johnmacfarlane.net/pandoc/")
  args <- c("--output", output,
            "--from", paste0("markdown_github",
                             "-hard_line_breaks",
                             "+superscript",
                             "+tex_math_dollars",
                             "+raw_html",
                             "+markdown_in_html_blocks",
                             "+pandoc_title_block"),
            "-H" , header,
            #"--toc", #currently still using custom toc
            "--smart",
            input)
  command <- paste("pandoc", paste(shQuote(args), collapse = " "))
  system(command)
}

#' Add the knitrBootstrap html header to an HTML file produced by knitr.
#'
#' This function includes the knitrBootstrap HTML headers to wrap the knitr
#' output in bootstrap styled HTML.
#' @param input html filename to be wrapped with Bootstrap.
#' @param output html filename to output.
#' @inheritParams create_header
#' @export

bootstrap_HTML = function(input, output = NULL, boot_style=NULL,
                          code_style=NULL, chooser=NULL, thumbsize=3,
                          show_code=FALSE, show_output=TRUE, show_figure=TRUE,
                          graphics = getOption("menu.graphics")) {
  if(is.null(output))
    output <- sub_ext(input, 'html')
  if(input == output)
    stop('input cannot be the same as output:', input, ' ', output)

  header = create_header(boot_style=boot_style, code_style=code_style,
                         chooser=chooser, thumbsize=thumbsize,
                         show_code=show_code, show_output=show_output,
                         show_figure=show_figure, graphics=graphics,
                         outfile=FALSE)

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

get_style <- function(style, style_type, title, graphics = getOption("menu.graphics")){
  style = if(is.null(style)){
    style_type[1]
  }
  else if(!is.null(style) && style == TRUE){
    style_type[menu(names(style_type), graphics, title)]
  }
  else {
    style_type[pmatch(tolower(style), tolower(names(style_type)))]
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
#' @param show_code show code blocks by default, can also be given a character
#'        vector of languages to show by default.
#' @param show_output show output blocks by default, can also be given a
#'        charater vector of which output types to show by default.
#' @param show_figure show figures by default.
#' @param graphics what graphics to use for the menus, only applicable if
#'        code_style or boot_style are true.
#' @param outfile if NULL, write the output file in a temporary directory, if a
#'        character write it to that location, if FALSE, return the header as a
#'        character.
#' @export

create_header <-
  function(boot_style=NULL, code_style=NULL, chooser=NULL, thumbsize=3,
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

    if(!thumbsize %in% 1:9)
      stop('thumbsize must be one of ', paste(1:9, collapse=', '))

    javascript = sub(thumb_pattern, paste('thumbsize = "col-md-', thumbsize, '"', sep=''), javascript)

    option_to_javascript = function(option){
      if(is.logical(option)){
        ifelse(option, 'true', 'false')
      }
      else {
        paste0('[', paste0(paste0('\\"', option, '\\"'), collapse=','), ']')
      }
    }

    javascript = sub(show_code_pattern, paste0('show_code = ', option_to_javascript(show_code)), javascript)

    javascript = sub(show_output_pattern, paste0('show_output = ', option_to_javascript(show_output)), javascript)

    javascript = sub(show_figure_pattern, paste0('show_figure = ', option_to_javascript(show_figure)), javascript)

    output = paste(includes,
                   '<script defer="defer">', javascript, '</script>',
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
  paste0(readLines(file), collapse='\n')
}

# substitute extension, from knitr
sans_ext = tools::file_path_sans_ext
sub_ext = function(x, ext) {
  if (grepl('\\.([[:alnum:]]+)$', x)) x = sans_ext(x)
  paste(x, ext, sep = '.')
}

#escape already escape strings
escape = function(string) gsub("([\"$`\\])", "\\\\\\1", string)

#simplified match function from perlrer
m = function(data, pattern){
  #check arguments

  process_matches = function(res, data){
    starts = attr(res, 'capture.start')
    if(is.null(starts)){
      return(res != -1)
    }
    lengths = attr(res, 'capture.length')
    names = attr(res, 'capture.names')
    ret = list()
    for(itr in seq_len(ncol(starts))){
      ret[[itr]] = unname(ifelse(starts[,itr] == -1, "FALSE",
                          substring(data, starts[,itr], starts[,itr] + lengths[,itr] - 1)))
    }
    names(ret) = ifelse(names == "", 1:ncol(starts), names)
    ret
  }

  process_matches(regexpr(pattern=pattern, data, perl=T), data)
}
