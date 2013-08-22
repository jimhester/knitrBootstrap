\name{create_header}
\alias{create_header}
\title{Create the html header based on the options given}
\usage{
  create_header(boot_style = NULL, code_style = NULL,
    chooser = NULL,
    thumbsize = c("col-md-3", "col-md-1", "col-md-2", "col-md-4", "col-md-5", "col-md-6", "col-md-7", "col-md-8", "col-md-9"),
    show_code = FALSE, show_output = TRUE,
    show_figure = TRUE,
    graphics = getOption("menu.graphics"), outfile = NULL)
}
\arguments{
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

  \item{show_code}{show code blocks by default.}

  \item{graphics}{what graphics to use for the menus, only
  applicable if code_style or boot_style are true.}

  \item{outfile}{if NULL, write the output file in a
  temporary directory, if a character write it to that
  location, if FALSE, return the header as a character.}
}
\description{
  Create the html header based on the options given
}

