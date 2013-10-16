\docType{package}
\name{primerTree}
\alias{primerTree}
\alias{primerTree-package}
\title{\pkg{knitrBootstrap} A framework to create Bootstrap 3 HTML reports from knitr
  Rmarkdown and RHTML.
See \code{\link{knit_bootstrap}} for the common usage.
If you are using RStudio, see the second example}
\description{
  \pkg{knitrBootstrap} A framework to create Bootstrap 3
  HTML reports from knitr Rmarkdown and RHTML. See
  \code{\link{knit_bootstrap}} for the common usage. If you
  are using RStudio, see the second example
}
\examples{
\dontrun{
#defaults only
knit_bootstrap('file.Rmd')
#Rstudio
#you also have to put render_html() in your rmd setup file, then use the
below code and the knit button
options(rstudio.markdownToHTML =
 function(inputFile, outputFile) {
   require(knitrBootstrap)
   knit_bootstrap_md(input=inputFile, output=outputFile)
 }
)
}
}

