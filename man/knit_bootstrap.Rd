\name{knit_bootstrap}
\alias{knit_bootstrap}
\title{knit a Rmd file and wrap it in bootstrap styles}
\usage{
  knit_bootstrap(infile, boot_style = NULL,
    code_style = NULL, chooser = NULL,
    markdown_options = c("skip_style", "base_64_images", "use_xhtml"),
    graphics = getOption("menu.graphics"), ...)
}
\arguments{
  \item{infile}{Rmd input file to knit}

  \item{boot_style}{the bootstrap style to use, if NULL
  uses the default, if TRUE a menu is shown with the
  available styles.}

  \item{code_style}{the highlight.js code style to use, if
  NULL uses the default, if TRUE a menu is shown with the
  available styles.}

  \item{chooser}{if "boot", adds a bootstrap style chooser
  to the html, if "code" adds the bootstrap code chooser.}

  \item{graphics}{what graphics to use for the menus, only
  applicable if code_style or boot_style are true.}

  \item{...}{additional arguments which are passed to
  knit2html}
}
\description{
  This function includes the knitr_bootstrap html headers
  to wrap the knitr output in bootstrap styled html.
}
\examples{
writeLines(c("# hello markdown", '```{r hello-random, echo=TRUE}', 'rnorm(5)', '```'), 'test.Rmd')
knit_bootstrap('test.Rmd', boot_style='Amelia', code_style='Dark', chooser=c('boot','code'))
if(interactive()) browseURL('test.html')
}

