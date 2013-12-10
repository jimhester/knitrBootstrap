\name{knit_bootstrap}
\alias{knit_bootstrap}
\alias{knit_bootstrap_Rmd}
\title{knit a Rmd file and wrap it in bootstrap styles}
\usage{
knit_bootstrap(input, output = NULL, boot_style = NULL, code_style = NULL,
  chooser = NULL, thumbsize = 3, show_code = FALSE, show_output = TRUE,
  show_figure = TRUE, markdown_options = c("mathjax", "base64_images",
  "use_xhtml"), ..., envir = parent.frame(), text = NULL, quiet = FALSE,
  encoding = getOption("encoding"), graphics = getOption("menu.graphics"))
}
\arguments{
  \item{input}{Rmd input file to knit into HTML}

  \item{output}{HTML output file created, if NULL uses the
  input filename with the extension changed to .html}

  \item{quiet}{whether to suppress the progress bar and
  messages}

  \item{envir}{the environment in which the code chunks are
  to be evaluated (can use \code{\link{new.env}()} to
  guarantee an empty new environment)}

  \item{encoding}{the encoding of the input file; see
  \code{\link{file}}}

  \item{markdown_options}{passed to markdownToHTML,
  defaults to mathjax, base64_images and use_xhtml.}

  \item{...}{options passed to
  \code{\link[markdown]{markdownToHTML}}}

  \item{text}{a character vector as an alternative way to
  provide the input file}

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
\examples{
writeLines(c("# hello markdown", '```{r hello-random, echo=TRUE}', 'rnorm(5)', '```'), 'test.Rmd')
knit_bootstrap('test.Rmd', boot_style='Amelia', code_style='Dark', chooser=c('boot','code'))
if(interactive()) browseURL('test.html')
}
\seealso{
  \code{\link{knit_bootstrap_md}} \code{\link{knit}},
  \code{\link[markdown]{markdownToHTML}}
}

