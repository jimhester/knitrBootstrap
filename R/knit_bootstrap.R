#' \pkg{knitrBootstrap} A framework to create Bootstrap 3 HTML reports from knitr
#'   Rmarkdown.
#' Knitr Bootstrap includes a \code{\link{bootstrap_document}} custom
#' rendering function for use with the rmarkdown
#' \url{http://http://rmarkdown.rstudio.com/}) package.
#'
#' You can also specify the options in your YAML front-matter, see the
#' rmarkdown documentation for examples.
#' @examples
#' \dontrun{
#' library(rmarkdown)
#' library(knitrBootstrap)
#'
#' render('input.Rmd', bootstrap_document())
#'
#' #with some options
#' render('input.Rmd', bootstrap_document(title='Test', highlight='Github',
#'   theme='Slate', theme.chooser=TRUE, highlight.chooser=TRUE))
#'}
#' @import knitr rmarkdown markdown
#' @name knirBootstrap
#' @docType package
NULL

#' @export
simple_document = function(css = NULL, theme = NULL, highlight = NULL, ...){
  theme = theme %||% 'default'
  highlight = highlight %||% 'default'

  results = rmarkdown::html_document(
    extra_dependencies=list(
      rmarkdown:::html_dependency_jquery(),
      html_dependency_bootstrap3(theme),
      html_dependency_hljs(highlight),
      html_dependency_magnific_popup(),
      html_dependency_simple()
      ),
    template=system.file(package='knitrBootstrap', 'templates/default.html'),
    theme=NULL, self_contained=FALSE, ...)

  results$knitr = list(
    opts_chunk = list(tidy=FALSE, highlight=FALSE),
    knit_hooks = simple_hooks()
  )

  results
}

#' @export
bootstrap_document = function(css = NULL, theme = NULL, highlight = NULL, ...){
  theme = theme %||% 'default'
  highlight = highlight %||% 'default'

  results = rmarkdown::html_document(
    extra_dependencies=list(rmarkdown:::html_dependency_jquery(),
      html_dependency_bootstrap3(theme),
      html_dependency_hljs(highlight),
      html_dependency_magnific_popup(),
      html_dependency_knitrBootstrap()
     ),
    template=system.file(package='knitrBootstrap', 'templates/default.html'),
      theme=NULL, self_contained=FALSE, ...)

  results$knitr = list(
                       opts_chunk = list(tidy=FALSE, highlight=FALSE),
                       knit_hooks = render_bootstrap_hooks()
                       )
  results
}

# create an html dependency for our bootstrap 3, originally from rmarkdown package
html_dependency_bootstrap3 <- function(theme) {
  htmltools::htmlDependency(name = "bootstrap3",
                 version = "3.2.0",
                 src = system.file("rmarkdown/rmd/bootstrap3/", package='knitrBootstrap'),
                 meta = list(viewport = "width=device-width, initial-scale=1.0"),
                 script = "js/bootstrap.min.js",
                 stylesheet = c("css/bootstrap.min.css",
                                paste0("css/themes/", theme, "/bootstrap.min.css")))
}
html_dependency_hljs <- function(highlight) {
  htmltools::htmlDependency(name = "highlightjs",
                            version = '8.2',
                            src = system.file(package='knitrBootstrap', 'rmarkdown/rmd/highlightjs/'),
                            script = 'highlight.pack.js',
                            stylesheet=paste0('highlight/', highlight, '.css'))
}
html_dependency_simple = function() {
  htmltools::htmlDependency(name = 'knitrBootstrap_simple',
                            version = '0.0.1',
                            src = system.file(package='knitrBootstrap', 'rmarkdown/templates/simple/skeleton/'),
                            script = 'js/simple.js',
                            stylesheet='css/simple.css')
}
html_dependency_knitrBootstrap = function() {
  htmltools::htmlDependency(name = 'knitrBootstrap',
                            version = '0.0.1',
                            src = system.file(package='knitrBootstrap', 'rmarkdown/templates/knitrBootstrap/skeleton/'),
                            script = 'js/knitrBootstrap.js',
                            stylesheet='css/knitrBootstrap.css')
}

html_dependency_magnific_popup = function() {
  htmltools::htmlDependency(name = 'MagnificPopup',
                            version = '0.9.9',
                            src = system.file(package='knitrBootstrap', 'rmarkdown/rmd/magnific_popup/'),
                            script = 'magnific-popup.js',
                            stylesheet='magnific-popup.css')
}

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
            link = function(...) tag('link', list(...)),
            title = function(...) tag('title', list(...))
            )
tag = function(type, arg_list){
  named_idx = nzchar(names(arg_list))
  named_idx = if(length(named_idx) == 0) FALSE else named_idx
  paste0('<', type, ' ', print_attributes(arg_list[named_idx]), '>',
         paste0(unlist(arg_list[!named_idx]), collapse='\n'), '</', type,'>')
}
bootstrap_chunk_hook = function(x, options){
  class = options[['bootstrap.class']] = options[['bootstrap.class']] %||% "row"
  tags$div(class=class, x)
}

"%||%" = function(x, y) if(is.null(x)) y else x

# there are 12 columns, odd numbers cannot be centered in the columns
calc_offset = function(size) {
  res = strsplit(size, "-")[[1]]
  num_size = as.numeric(res[3])
  offset = paste0(res[1], 'offset-', (12 - (num_size + (num_size %% 2)))/2)
}
bootstrap_plot_hook = function(x, options) {
  fig = hook_plot_md(x, options)
  thumbnail = options[['bootstrap.thumbnail']] = options[['bootstrap.thumbnail']] %||% TRUE
  thumbnail_size = options['bootstrap.thumbnail.size'] = options[['bootstrap.thumbnail.size']] %||% 'col-md-6'
  if(!thumbnail){
    return(tags$div(class=c('row', 'text-center'), fig))
  }
  fig = tags$a(href='#', class='thumbnail', fig)
  if(options$fig.show == 'hold'){
  tags$div(class=thumbnail_size,
      fig
      )
  }
  else{ #only one figure from this code block so center it
    tags$div(class=c('row'),
      tags$div(class=c(calc_offset(thumbnail_size), thumbnail_size),
               fig
               )
      )
  }
}

language_link = function(language){
  tags$li(class='active',
          tags$a(
                 href="#",
                 class=c("toggle-global", "source", language),
                 type=c(paste(sep=".", "source", language)),
                 language
                 )
          )
}
output_link = function(type){
  tags$li(class='active',
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
  default_theme = knitr::opts_knit$get('bootstrap.theme') %||% 'Default'
  default_highlight = knitr::opts_knit$get('bootstrap.highlight') %||% 'HighlightJs'
  theme_chooser = knitr::opts_knit$get('bootstrap.theme.chooser') %||% FALSE
  highlight_chooser = knitr::opts_knit$get('bootstrap.highlight.chooser') %||% FALSE
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
                                            tags$li(class='active', tags$a(href="#", type='figure', class="toggle-global", "Figures"))
                                            ),
                                    if(theme_chooser) generate_style_toggle('Bootstrap theme', 'theme-switch', names(themes), default_theme),
                                    if(highlight_chooser) generate_style_toggle('Code highlighting', 'highlight-switch', names(highlights), default_highlight)
                                    )
                           )
                  )
         ,if(theme_chooser) generate_style_links('theme', themes, default_theme)
         ,if(highlight_chooser) generate_style_links('highlight', highlights, default_highlight)
         )
}
generate_style_links = function(type, data, default){
  paste0(collapse='\n',
         paste0(collapse='\n',
         lapply(names(data),
                function(class){
                  tags$link(rel='alternate stylesheet', type='text/css', href=data[class], title=class, media='screen')
                }))
         )
}
generate_style_toggle = function(title, type, values, default) {
  match = pmatch(tolower(default), tolower(values))
  if(is.na(match)){
    stop('No ', title, ' matches `', default, '`', ' valid are ', paste0(values, collapse=', '))
  }
  tags$ul(class='nav navbar-nav navbar-left',
          tags$li(class=c("dropup"),
                  tags$a(href=c("#"),
                         class="dropdown-toggle",
                         "data-toggle"="dropdown",
                         paste(title, " ", tags$b(class="caret"))),
                  tags$ul(class=c("dropdown-menu"),
                          mapply(generate_style_class, values, type, seq_along(values) == match)
                          )
                  )
          )
}
generate_style_class = function(class, type, active){
  if(active == TRUE){
    tags$li(class='active', tags$a(class=type, title=class, href='#', class))
  }
  else {
    tags$li(tags$a(class=type, title=class, href='#', class))
  }
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

generate_simple_panel = function(engine, name, x, show){
  tags$div(class=c('panel', panel_types[name]),
           tags$button(class=c('btn', 'btn-default', 'btn-xs', button_types[name]),
                       tags$span(class=c('glyphicon', 'glyphicon-chevron-left'))),
           tags$pre(tags$code(class=c(name, tolower(engine)), x))
           )
}

generate_document_hook = function(languages, types) {
  function(x){
    if(!opts_knit$get('child')){
      title = knitr::opts_knit$get('bootstrap.title') %||% NULL
      paste0(collapse='\n',
             if(!is.null(title)) tags$title(title) else '',
             tags$div(id="wrap",
                      tags$div(class="container",
                               tags$div(class="row row-offcanvas row-offcanvas-right",
                                        tags$div(class=c("contents", "col-xs-12", "col-md-10"), x)
                               ),
                      if (opts_knit$get('bootstrap.menu') %||% TRUE) toggle_menu(names(languages), names(types)[ names(types) != 'source' ])
                      ),
             #footer
             tags$div(id='push'),
             tags$div(id='footer', generate_footer()),
             style_links(options)
             ))
    }
    else {
      x
    }
  }
}

style_link = function(type, styles, default){
  match = pmatch(tolower(default), tolower(names(styles)))
  if(is.na(match)){
    stop('No ', type, ' matches `', default, '`', ' valid are ', paste0(names(styles), collapse=', '))
  }
  tags$link(rel='stylesheet', id=type, href=styles[match], media='screen')
}
style_links = function(options){
  default_theme = knitr::opts_knit$get('bootstrap.theme') %||% 'Default'
  default_highlight = knitr::opts_knit$get('bootstrap.highlight') %||% 'HighlightJs'
  paste0(collapse='\n',
         style_link('theme', themes, default_theme),
         style_link('highlight', highlights, default_highlight)
         )
}

#' Set knitr bootstrap output functions
#'
#' This function sets the appropriate knitr output hooks to produce a bootstrap
#' styled report.
#' @details
#'
#' This will allow use of the knitr bootstrap output hooks without the
#' rmarkdown package.  Note you still need to use pandoc to generate the HTML
#' document, as the sundown library in the markdown package cannot handle
#' markdown embedded in HTML tags, which knitr bootstrap uses.
#' @export
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
      panel = options$bootstrap.panel = options$bootstrap.panel %||% FALSE
      show = switch(name,
                    source = (options[['bootstrap.show.code']] = options[['bootstrap.show.code']] %||% TRUE),
                    output = (options[['bootstrap.show.output']] = options[['bootstrap.show.output']] %||% TRUE),
                    message = (options[['bootstrap.show.message']] = options[['bootstrap.show.message']] %||% TRUE),
                    warning = (options[['bootstrap.show.warning']] = options[['bootstrap.show.warning']] %||% TRUE),
                    error = (options[['bootstrap.show.error']] = options[['bootstrap.show.error']] %||% TRUE),
                    TRUE)
      if(panel) generate_panel(engine, name, x, !show) else generate_button(engine, name, x, !show)
    }
  }
  h = knitr::opts_knit$get("header")
  z = list()
  for (i in c("source", "warning", "message", "error")) z[[i]] = html.hook(i)
  c(z,
    list(
       'output' = html.hook("output"),
       'plot' = bootstrap_plot_hook,
       'chunk' = bootstrap_chunk_hook
    )
  )
}

simple_hooks = function() {
  html_hook = function(name) {
    force(name)
    function(x, options) {
      engine = options$engine
      x = paste(x, collapse = "\n")
      show = switch(name,
                    source = (options[['bootstrap.show.code']] = options[['bootstrap.show.code']] %||% TRUE),
                    output = (options[['bootstrap.show.output']] = options[['bootstrap.show.output']] %||% TRUE),
                    message = (options[['bootstrap.show.message']] = options[['bootstrap.show.message']] %||% TRUE),
                    warning = (options[['bootstrap.show.warning']] = options[['bootstrap.show.warning']] %||% TRUE),
                    error = (options[['bootstrap.show.error']] = options[['bootstrap.show.error']] %||% TRUE),
                    TRUE)
      generate_simple_panel(engine, name, x, show)
    }
  }
  c(
    sapply(c("source", "warning", "message", "error", "output"), html_hook),
    plot = bootstrap_plot_hook,
    chunk = bootstrap_chunk_hook,
    NULL
    )
}

generate_footer = function(){
  tags$div(class=c("container"),
           tags$p(class=c("text-muted"), id="credit", "Styled with ",
                  tags$a( href='https://github.com/jimhester/knitrBootstrap', "knitrBootstrap")
                  )
           )
}
