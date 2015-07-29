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


panel_types <- c("source" = "panel-primary",
                 "output" = "panel-success",
                 "message" = "panel-info",
                 "warning" = "panel-warning",
                 "error" = "panel-danger")

button_types <- c("source" = "btn-primary",
                 "output" = "btn-success",
                 "message" = "btn-info",
                 "warning" = "btn-warning",
                 "error" = "btn-danger")
#" @export
simple_document <- function(css = NULL, theme = NULL, highlight = NULL, ...){
  theme <- theme %||% "default"
  highlight <- highlight %||% "default"

  results <- rmarkdown::html_document(
    highlight = NULL,
    theme = NULL,
    extra_dependencies=list(
      rmarkdown:::html_dependency_jquery(),
      html_dependency_bootstrap3(theme),
      html_dependency_hljs(highlight),
      html_dependency_magnific_popup(),
      html_dependency_simple()
      ),
    template =
      system.file(
        package="knitrBootstrap", "rmarkdown/rmd/default.html"),
        pandoc_args = check_pandoc_args(pandoc_args),
        self_contained = FALSE, ...)

  results$knitr <- list(
    opts_chunk = list(tidy=FALSE, highlight=FALSE),
    knit_hooks = simple_hooks()
  )

  results
}

#" @export
bootstrap_document <- function(css = NULL, theme = NULL, highlight = NULL, pandoc_args, ...){
  theme <- theme %||% "default"
  highlight <- highlight %||% "default"

  results <- rmarkdown::html_document(
    highlight = NULL,
    theme = NULL,
    extra_dependencies=list(rmarkdown:::html_dependency_jquery(),
      html_dependency_bootstrap3(theme),
      html_dependency_hljs(highlight),
      html_dependency_magnific_popup(),
      html_dependency_knitrBootstrap()
     ),
    template=system.file(package="knitrBootstrap", "rmarkdown/rmd/default.html"),
        pandoc_args = check_pandoc_args(pandoc_args),
      self_contained=FALSE, ...)

  results$knitr <- list(
                       opts_chunk = list(tidy=FALSE, highlight=FALSE),
                       knit_hooks = render_bootstrap_hooks()
                       )
  results
}

# create an html dependency for our bootstrap 3, originally from rmarkdown package
html_dependency_bootstrap3 <- function(theme) {
  htmltools::htmlDependency(name = "bootstrap3",
                 version = "3.2.0",
                 src = system.file("rmarkdown/rmd/bootstrap3/", package="knitrBootstrap"),
                 meta = list(viewport = "width=device-width, initial-scale=1.0"),
                 script = "js/bootstrap.min.js",
                 stylesheet = c("css/bootstrap.min.css",
                                paste0("css/themes/", theme, "/bootstrap.min.css")))
}

html_dependency_hljs <- function(highlight) {
  htmltools::htmlDependency(name = "highlightjs",
                            version = "8.2",
                            src = system.file(package="knitrBootstrap", "rmarkdown/rmd/highlightjs/"),
                            script = "highlight.pack.js",
                            stylesheet=paste0("highlight/", highlight, ".css"))
}

html_dependency_simple <- function() {
  htmltools::htmlDependency(name = "knitrBootstrap_simple",
                            version = "0.0.1",
                            src = system.file(package="knitrBootstrap", "rmarkdown/templates/simple/skeleton/"),
                            script = "js/simple.js",
                            stylesheet="css/simple.css")
}

html_dependency_knitrBootstrap <- function() {
  htmltools::htmlDependency(name = "knitrBootstrap",
                            version = "0.0.1",
                            src = system.file(package="knitrBootstrap", "rmarkdown/templates/knitrBootstrap/skeleton/"),
                            script = "js/knitrBootstrap.js",
                            stylesheet="css/knitrBootstrap.css")
}

html_dependency_magnific_popup <- function() {
  htmltools::htmlDependency(name = "MagnificPopup",
                            version = "0.9.9",
                            src = system.file(package="knitrBootstrap", "rmarkdown/rmd/magnific_popup/"),
                            script = "magnific-popup.js",
                            stylesheet="magnific-popup.css")
}


bootstrap_chunk_hook <- function(x, options){
  class <- options[["bootstrap.class"]] <- options[["bootstrap.class"]] %||% "row"
  tags$div(class=class, x)
}

# there are 12 columns, odd numbers cannot be centered in the columns
calc_offset <- function(size) {
  res <- strsplit(size, "-")[[1]]
  num_size <- as.numeric(res[3])
  offset <- paste0(paste0(res[1:2], collapse = "-"), "-offset-", (12 - (num_size + (num_size %% 2))) / 2)
  offset
}

bootstrap_plot_hook <- function(x, options) {
  fig <- hook_plot_md(x, options)
  thumbnail <- options[["bootstrap.thumbnail"]] <- options[["bootstrap.thumbnail"]] %||% TRUE
  thumbnail_size <- options["bootstrap.thumbnail.size"] <- options[["bootstrap.thumbnail.size"]] %||% "col-md-6"
  if (!thumbnail) {
    return(tags$div(class = c("row", "text-center"), fig))
  }
  fig <- tags$a(href = "#", class = "thumbnail", fig)
  if (options$fig.show == "hold"){
  tags$div(class = thumbnail_size,
      fig
      )
  } else { #only one figure from this code block so center it
    tags$div(class = c("row"),
      tags$div(class = c(calc_offset(thumbnail_size), thumbnail_size),
               fig
               )
      )
  }
}

generate_button <- function(engine, name, x, hide){
  glyph <- if (hide) "glyphicon-chevron-up" else "glyphicon-chevron-down"
  hidden <- if (hide) "display:none" else ""
  text <- paste(tags$span(class = c("glyphicon", glyph)), engine, name)
  paste0(
         tags$button(class = c(name, engine, "toggle", "btn", "btn-xs", button_types[name]), text),
         tags$pre(style = hidden, tags$code(class = c(name, tolower(engine)), x))
         )
}

generate_panel <- function(engine, name, x, hide){
  glyph <- if (hide) "glyphicon-chevron-up" else "glyphicon-chevron-down"
  hidden <- if (hide) "display:none" else ""
  text <- tags$h5(class="panel-title", paste0(tags$span(class=c("glyphicon", glyph)), paste(collapse=" ", engine, name)))
  tags$div(class=c("panel", panel_types[name]),
           tags$div(class=c(name, engine, "panel-heading", "toggle"), text),
           tags$pre(style=hidden, tags$code(class=c(name, tolower(engine)), x))
           )
}

generate_simple_panel <- function(engine, name, x, show){
  tags$div(class=c("panel", panel_types[name]),
           tags$button(class=c("btn", "btn-default", "btn-xs", button_types[name]),
                       tags$span(class=c("glyphicon", "glyphicon-chevron-left"))),
           tags$pre(tags$code(class=c(name, tolower(engine)), x))
           )
}

render_bootstrap_hooks <- function() {
  languages <- list()
  types <- list()
  html_hook <- function(name) {
    force(name)
    function(x, options) {
      x <- paste(x, collapse = "\n")
      engine <- options$engine
      languages[engine] <<- 1
      types[name] <<- 1
      show <- switch(name,
                    source = (options[["bootstrap.show.code"]] <- options[["bootstrap.show.code"]] %||% TRUE),
                    output = (options[["bootstrap.show.output"]] <- options[["bootstrap.show.output"]] %||% TRUE),
                    message = (options[["bootstrap.show.message"]] <- options[["bootstrap.show.message"]] %||% TRUE),
                    warning = (options[["bootstrap.show.warning"]] <- options[["bootstrap.show.warning"]] %||% TRUE),
                    error = (options[["bootstrap.show.error"]] <- options[["bootstrap.show.error"]] %||% TRUE),
                    TRUE)
      type <- options$bootstrap.type <- options$bootstrap.type %||% "simple"
      switch(type,
        simple = generate_simple_panel(engine, name, x, !show),
        panel = generate_panel(engine, name, x, !show),
        button = generate_button(engine, name, x, !show),
        stop("invalid option for `bootstrap.type`")
        )
    }
  }
  c(
    sapply(c("source", "warning", "message", "error", "output"), html_hook),
    plot = bootstrap_plot_hook,
    chunk = bootstrap_chunk_hook,
    NULL
    )
}

simple_hooks <- function() {
  html_hook <- function(name) {
    force(name)
    function(x, options) {
      x <- paste(x, collapse = "\n")
      show <- switch(name,
                    source = (options[["bootstrap.show.code"]] <- options[["bootstrap.show.code"]] %||% TRUE),
                    output = (options[["bootstrap.show.output"]] <- options[["bootstrap.show.output"]] %||% TRUE),
                    message = (options[["bootstrap.show.message"]] <- options[["bootstrap.show.message"]] %||% TRUE),
                    warning = (options[["bootstrap.show.warning"]] <- options[["bootstrap.show.warning"]] %||% TRUE),
                    error = (options[["bootstrap.show.error"]] <- options[["bootstrap.show.error"]] %||% TRUE),
                    TRUE)
      generate_simple_panel(engine, name, x, !show)
    }
  }
  c(
    sapply(c("source", "warning", "message", "error", "output"), html_hook),
    plot = bootstrap_plot_hook,
    chunk = bootstrap_chunk_hook,
    NULL
    )
}
