\name{bootstrap_HTML}
\alias{bootstrap_HTML}
\title{Add the knitrBootstrap html header to an HTML file produced by knitr.}
\usage{
  bootstrap_HTML(input, output = NULL, boot_style = NULL,
    code_style = NULL, chooser = NULL,
    graphics = getOption("menu.graphics"))
}
\arguments{
  \item{input}{html filename to be wrapped with Bootstrap.}

  \item{output}{html filename to output.}

  \item{boot_style}{the bootstrap style to use if
  character, if NULL uses the default, if TRUE a menu is
  shown with the available styles.}

  \item{code_style}{the highlight.js code style to use if
  character, if NULL uses the defaults, if TRUE a menu is
  shown with the available styles.}

  \item{chooser}{a character vector, if contains "boot",
  adds a bootstrap style chooser to the HTML, if contains
  "code" adds the bootstrap code chooser.}

  \item{graphics}{what graphics to use for the menus, only
  applicable if code_style or boot_style are true.}
}
\description{
  This function includes the knitrBootstrap HTML headers to
  wrap the knitr output in bootstrap styled HTML.
}

