\name{knit_bootstrap_md}
\alias{knit_bootstrap_md}
\title{knit a md file and wrap it in bootstrap styles}
\usage{
knit_bootstrap_md(input, output = NULL, boot_style = NULL,
  code_style = NULL, chooser = NULL, text = NULL, thumbsize = 3,
  show_code = FALSE, show_output = TRUE, show_figure = TRUE,
  markdown_options = c("mathjax", "base64_images", "use_xhtml"),
  graphics = getOption("menu.graphics"), ...)
}
\arguments{
  \item{input}{md input file to be converted to HTML'}

  \item{output}{HTML output file created, if NULL uses the
  input filename with the extension changed to .html}

  \item{text}{a character vector as an alternative way to
  provide the input file}

  \item{markdown_options}{passed to markdownToHTML,
  defaults to mathjax, base64_images and use_xhtml.}

  \item{...}{options passed to
  \code{\link[markdown]{markdownToHTML}}}

  \item{boot_style}{the bootstrap style to use if
  character, if NULL uses the default, if TRUE a menu is
  shown with the available styles.}

  \item{code_style}{the highlight.js code style to use if
  character, if NULL uses the defaults, if TRUE a menu is
  shown with the available styles.}

  \item{chooser}{a character vector, if contains "boot",
  adds a bootstrap style chooser to the HTML, if contains
  "code" adds the bootstrap code chooser.}

  \item{thumbsize}{size of thumbnails in bootstrap
  columns.}

  \item{show_code}{show code blocks by default, can also be
  given a character vector of languages to show by
  default.}

  \item{show_output}{show output blocks by default, can
  also be given a charater vector of which output types to
  show by default.}

  \item{show_figure}{show figures by default.}

  \item{graphics}{what graphics to use for the menus, only
  applicable if code_style or boot_style are true.}
}
\description{
  This function includes the knitrBootstrap HTML headers to
  wrap the knitr output in bootstrap styled HTML.
}
\seealso{
  \code{\link{knit_bootstrap}} \code{\link{knit}},
  \code{\link[markdown]{markdownToHTML}}
}

