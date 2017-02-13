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
#' @name knitrBootstrap
#' @docType package
NULL

themes = c(
                'Default'='https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css',
                'Cerulean'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css',
                'Cosmo'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/cosmo/bootstrap.min.css',
                'Cyborg'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/cyborg/bootstrap.min.css',
                'Darkly'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/darkly/bootstrap.min.css',
                'Flatly'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css',
                'Journal'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/journal/bootstrap.min.css',
                'Lumen'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/lumen/bootstrap.min.css',
                'Paper'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/paper/bootstrap.min.css',
                'Readable'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/readable/bootstrap.min.css',
                'Sandstone'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/sandstone/bootstrap.min.css',
                'Simplex'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/simplex/bootstrap.min.css',
                'Slate'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/slate/bootstrap.min.css',
                'Spacelab'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/spacelab/bootstrap.min.css',
                'Superhero'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/superhero/bootstrap.min.css',
                'United'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/united/bootstrap.min.css',
                'Yeti'='https://netdna.bootstrapcdn.com/bootswatch/3.3.7/yeti/bootstrap.min.css'
                )

highlights = c(
                'Agate'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/agate.min.css",
                'Android Studio'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/androidstudio.min.css",
                'Arduino Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/arduino-light.min.css",
                'Arta'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/arta.min.css",
                'Ascetic'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/ascetic.min.css",
                'Atelier Cave Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-cave-dark.min.css",
                'Atelier Cave Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-cave-light.min.css",
                'Atelier Dune Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-dune-dark.min.css",
                'Atelier Dune Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-dune-light.min.css",
                'Atelier Estuary Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-estuary-dark.min.css",
                'Atelier Estuary Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-estuary-light.min.css",
                'Atelier Forest Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-forest-dark.min.css",
                'Atelier Forest Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-forest-light.min.css",
                'Atelier Heath Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-heath-dark.min.css",
                'Atelier Heath Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-heath-light.min.css",
                'Atelier Lakeside Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-lakeside-dark.min.css",
                'Atelier Lakeside Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-lakeside-light.min.css",
                'Atelier Plateau Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-plateau-dark.min.css",
                'Atelier Plateau Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-plateau-light.min.css",
                'Atelier Savanna Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-savanna-dark.min.css",
                'Atelier Savanna Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-savanna-light.min.css",
                'Atelier Seaside Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-seaside-dark.min.css",
                'Atelier Seaside Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-seaside-light.min.css",
                'Atelier Sulphurpool Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-sulphurpool-dark.min.css",
                'Atelier Sulphurpool Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atelier-sulphurpool-light.min.css",
                'Atome One Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atom-one-dark.min.css",
                'Atome One Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/atom-one-light.min.css",
                'Brown Paper'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/brown-paper.min.css",
                'Brown Paper SQ'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/brown-papersq.png",
                'Codepen Embed'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/codepen-embed.min.css",
                'Color Brewer'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/color-brewer.min.css",
                'Darcula'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/darcula.min.css",
                'Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/dark.min.css",
                'Darkula'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/darkula.min.css",
                'HighlightJs'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/default.min.css",
                'Docco'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/docco.min.css",
                'Dracula'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/dracula.min.css",
                'Far'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/far.min.css",
                'Foundation'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/foundation.min.css",
                'Github Gist'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/github-gist.min.css",
                'Github'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/github.min.css",
                'Google Code'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/googlecode.min.css",
                'Grayscale'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/grayscale.min.css",
                'Gruvbox Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/gruvbox-dark.min.css",
                'Gruvbox Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/gruvbox-light.min.css",
                'Hopscotch'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/hopscotch.min.css",
                'Hybrid'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/hybrid.min.css",
                'Idea'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/idea.min.css",
                'Ir Black'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/ir-black.min.css",
                'Kimbie Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/kimbie.dark.min.css",
                'Kimbie Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/kimbie.light.min.css",
                'Magula'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/magula.min.css",
                'Mono Blue'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/mono-blue.min.css",
                'Monokai Sublime'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/monokai-sublime.min.css",
                'Monokai'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/monokai.min.css",
                'Obsidian'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/obsidian.min.css",
                'Ocean'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/ocean.min.css",
                'Paraiso Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/paraiso-dark.min.css",
                'Paraiso Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/paraiso-light.min.css",
                'Pojoaque'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/pojoaque.min.css",
                'Purebasic'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/purebasic.min.css",
                'Qtcreator Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/qtcreator_dark.min.css",
                'Qtcreater Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/qtcreator_light.min.css",
                'Railscasts'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/railscasts.min.css",
                'Rainbow'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/rainbow.min.css",
                'School Book'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/school-book.min.css",
                'Solarized Dark'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/solarized-dark.min.css",
                'Solarized Light'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/solarized-light.min.css",
                'Sunburst'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/sunburst.min.css",
                'Tomorrow Night Blue'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/tomorrow-night-blue.min.css",
                'Tomorrow Night Bright'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/tomorrow-night-bright.min.css",
                'Tomorrow Night Eighties'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/tomorrow-night-eighties.min.css",
                'Tomorrow Night'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/tomorrow-night.min.css",
                'Tomorrow'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/tomorrow.min.css",
                'Vs'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/vs.min.css",
                'Xcode'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/xcode.min.css",
                'Xt256'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/xt256.min.css",
                'Zenburn'="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/zenburn.min.css")
                

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
#' @param ... options passed to \code{\link[knitr]{knit}}
#' @seealso \code{\link{knit_bootstrap_md}}
#' @aliases knit_bootstrap knit_bootstrap_Rmd
#' @export
knit_bootstrap = function(input, output = NULL, ...) {

  message('knit_bootstrap is being deprecated, and will be removed in the next release of knitrBootstrap,',
          ' consider using rmarkdown::render with knitrBootstrap::bootstrap_document instead.\n',
          'See http://github.com/jimhester/knitrBootstrap for more details')

  render_bootstrap()
  md_file = knit(input, NULL, ...)
  knit_bootstrap_md(md_file, output)
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
#' @seealso \code{\link{knit_bootstrap}} \code{\link{knit}},
#'          \code{\link[markdown]{markdownToHTML}}
#' @export
knit_bootstrap_md = function(input, output = NULL) {
  header = create_header()

  if(is.null(output))
    output = sub_ext(input, 'html')

  pandoc(input, output, header)
  invisible(output)
}

#' Add the knitrBootstrap html header to an HTML file produced by knitr.
#'
#' This function includes the knitrBootstrap HTML headers to wrap the knitr
#' output in bootstrap styled HTML.
#' @param input html filename to be wrapped with Bootstrap.
#' @param output html filename to output.
#' @export
bootstrap_HTML = function(input, output = NULL) {
  if(is.null(output))
    output = sub_ext(input, 'html')
  if(input == output)
    stop('input cannot be the same as output:', input, ' ', output)

  header = create_header()

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

create_header = function(custom.header=NULL) {

    includes = read_package_file('templates/knitr_bootstrap_includes.html')
    javascript = read_package_file('templates/knitr_bootstrap.js')
    css = read_package_file('templates/knitr_bootstrap.css')

    output = paste(includes,
                   '<script defer="defer">', javascript, '</script>',
                   '<style>', css, '</style>\n',
                   sep='\n')

    if (!is.null(custom.header)) {
        output = paste0(output,
                        readChar(custom.header, file.info(custom.header)$size),
                        '\n')
    }


    outfile = paste(tempdir(), 'knitr_bootstrap_full.html', sep='/')
    cat(output, file=outfile)
    invisible(outfile)
  }

pandoc = function(input=NULL, output, header) {
  if (Sys.which("pandoc") == "")
    stop("Please install pandoc first: http://johnmacfarlane.net/pandoc/")
  args = c("--output", output,
            "--from", paste0("markdown_github",
                             "-hard_line_breaks",
                             "+superscript",
                             "+tex_math_dollars",
                             "+raw_html",
                             "+markdown_in_html_blocks",
                             "+pandoc_title_block"),
            "-H" , header,
            "--smart",
            input)
  command = paste("pandoc", paste(shQuote(args), collapse = " "))
  system(command)
}

#' Convert to a Bootstrap styled HTML document
#'
#' rmarkdown Format for converting from R markdown to Bootstrap styled HTML
#' @param title Title to use in the bootstrap document
#' @param theme Visual theme ('Default', 'Amelia', 'Cerulean', 'Cosmo',
#' 'Cyborg', 'Journal', 'Flatly', 'Readable', 'Simplex', 'Slate', 'Spacelab',
#' 'United').
#' @param highlight Syntax highlighting style ('HighlightJs', 'Dark', 'Far',
#' 'Idea', 'Sunburst', 'Zenburn', 'Visual Studio', 'Ascetic', 'Magula',
#' 'Github', 'Google Code', 'Brown Paper', 'School Book', 'IR Black',
#' 'Solarized - Dark', 'Solarized - Light', 'Arta', 'Monokai', 'Xcode',
#' 'Pojoaque', 'Rainbow', 'Tomorrow', 'Tomorrow Night',
#' 'Tomorrow Night Bright', 'Tomorrow Night Blue', 'Tomorrow Night Eighties').
#' @param theme.chooser Adds a dynamic theme chooser to the page, pass `TRUE`
#' to include.
#' @param highlight.chooser Adds a dynamic highlight chooser to the page, pass `TRUE`
#' to include.
#' @param custom.header HTML file containing any extra header logic such as
#' external script or CSS includes.
#' @seealso \code{\link[rmarkdown]{render}}
#' @export
bootstrap_document = function(title=NULL, theme='default', highlight='highlightjs', theme.chooser=FALSE,
                              highlight.chooser=FALSE, menu=TRUE, custom.header=NULL, clean_supporting=TRUE){
  # Generate header
  header = create_header(custom.header)

  output_format(knitr = knitr_options(
                                      opts_knit=list('upload.fun' = knitr::image_uri,
                                                     'bootstrap.title'=title,
                                                     'bootstrap.theme'=theme,
                                                     'bootstrap.highlight'=highlight,
                                                     'bootstrap.theme.chooser'=theme.chooser,
                                                     'bootstrap.highlight.chooser'=highlight.chooser,
                                                     'bootstrap.menu'=menu,
                                                     'custom.header'=custom.header
                                                     ),
                                      opts_chunk = list(tidy=FALSE, highlight=FALSE),
                                      knit_hooks=render_bootstrap_hooks()),
                pandoc = pandoc_options(to = "html",
                                        from = bootstrap_pandoc_options,
                                        args=c('-H', header)),
                clean_supporting=clean_supporting)
  #pandoc --self-contained breaks on bootswatch css `//` urls, if(self_contained) '--self-contained' else '')),
}
append_files = function(files){
paste(mapply(read_package_file, files), collapse='\n')
}

read_package_file = function(path){
  location = paste(system.file(package='knitrBootstrap'), path, sep='/')
  read_file(location)
}

read_file = function(file){
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
  #if (knitr:::output_asis(x, options))
    #return(x)
  class = options[['bootstrap.class']] = options[['bootstrap.class']] %n% "row"
  tags$div(class=class, x)
}

`%n%` = function(x, y) if(is.null(x)) y else x

# there are 12 columns, odd numbers cannot be centered in the columns
calc_offset = function(size){
  res = m(size, '(.*)(\\d+)')
  num_size = as.numeric(res[[2]])
  offset = paste0(res[[1]], 'offset-', (12 - (num_size + (num_size %% 2)))/2)
}
bootstrap_plot_hook = function(x, options) {
  fig = hook_plot_md(x, options)
  thumbnail = options[['bootstrap.thumbnail']] = options[['bootstrap.thumbnail']] %n% TRUE
  thumbnail_size = options['bootstrap.thumbnail.size'] = options[['bootstrap.thumbnail.size']] %n% 'col-md-6'
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
  default_theme = knitr::opts_knit$get('bootstrap.theme') %n% 'Default'
  default_highlight = knitr::opts_knit$get('bootstrap.highlight') %n% 'HighlightJs'
  theme_chooser = knitr::opts_knit$get('bootstrap.theme.chooser') %n% FALSE
  highlight_chooser = knitr::opts_knit$get('bootstrap.highlight.chooser') %n% FALSE
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

generate_document_hook = function(languages, types) {
  function(x){
    if(!opts_knit$get('child')){
      title = knitr::opts_knit$get('bootstrap.title') %n% NULL
      paste0(collapse='\n',
             if(!is.null(title)) tags$title(title) else '',
             tags$div(id="wrap",
                      tags$div(class="container",
                               tags$div(class="row row-offcanvas row-offcanvas-right",
                                        tags$div(class=c("contents", "col-xs-12", "col-md-10"), x)
                               ),
                      if (opts_knit$get('bootstrap.menu') %n% TRUE) toggle_menu(names(languages), names(types)[ names(types) != 'source' ])
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
  default_theme = knitr::opts_knit$get('bootstrap.theme') %n% 'Default'
  default_highlight = knitr::opts_knit$get('bootstrap.highlight') %n% 'HighlightJs'
  paste0(collapse='\n',
         style_link('theme', themes, default_theme),
         style_link('highlight', highlights, default_highlight)
         )
}

bootstrap_pandoc_options = paste0('markdown',
                                  "-hard_line_breaks",
                                  "+superscript",
                                  "+tex_math_dollars",
                                  "+raw_html",
                                  "+markdown_in_html_blocks",
                                  #"+pandoc_title_block",
                                  "-implicit_figures", collapse="")


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
      panel = options$bootstrap.panel = options$bootstrap.panel %n% FALSE
      show = switch(name,
                    source = (options[['bootstrap.show.code']] = options[['bootstrap.show.code']] %n% TRUE),
                    output = (options[['bootstrap.show.output']] = options[['bootstrap.show.output']] %n% TRUE),
                    message = (options[['bootstrap.show.message']] = options[['bootstrap.show.message']] %n% TRUE),
                    warning = (options[['bootstrap.show.warning']] = options[['bootstrap.show.warning']] %n% TRUE),
                    error = (options[['bootstrap.show.error']] = options[['bootstrap.show.error']] %n% TRUE),
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
       'chunk' = bootstrap_chunk_hook,
       'document' = generate_document_hook(languages, types)
    )
  )
}
generate_footer = function(){
  tags$div(class=c("container"),
           tags$p(class=c("text-muted"), id="credit", "Styled with ",
                  tags$a( href='https://github.com/jimhester/knitrBootstrap', "knitrBootstrap")
                  )
           )
}
