#TODO make windows compatible, will be a pain, need to remove perl compatibilities

get_style <- function(style, style_type, title, graphics = getOption("menu.graphics")){
  style = if(!is.null(style) && style %in% names(style_type)){
    style_type[style]
  }
  else if(!is.null(style) && style == TRUE){
    style_type[menu(names(style_type), graphics, title)]
  }
  else {
    style_type[1]
  }
  return(style)
}

knit_bootstrap <- function(infile, style=NULL, code_style=NULL, chooser=NULL, markdown_options=c('skip_style', 'base_64_images', 'use_xhtml'), graphics = getOption("menu.graphics"), ...){
  #TODO modify header
  header = create_header(chooser, style, code_style, graphics)

  require(markdown)
  require(knitr)
  knit2html(
    infile,
    header=header,
    options=markdown_options
  )
}

style_url="http://netdna.bootstrapcdn.com/bootswatch/2.3.1/$style/bootstrap.min.css"

create_header <- function(chooser=c('style', 'code'), style=NULL, code_style=NULL, graphics = getOption("menu.graphics")){

  style=get_style(style, styles, 'Bootstrap Style', graphics)
  code_style=get_style(code_style, code_styles, 'Code Block Style', graphics)

  package_root = system.file(package='knitrBootstrap')
  header = paste(package_root, 'templates/knitr_bootstrap.html', sep='/')

  header_lines = file_lines(header)

  header_lines = gsub('(<link rel="stylesheet".*href=")(http://yandex.st/highlightjs/7.3/styles/vs.min.css)"', paste('\\1', style, '"', sep=''), header_lines)

  header_lines = gsub('(<link rel="stylesheet".*href=")(http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css)"', paste('\\1', code_style, '"', sep=''), header_lines)

  chooser = match.arg(chooser, several.ok=TRUE)
  filenames = if('style' %in% chooser){
    paste(package_root, 'templates/knitr_bootstrap_style_toggle.html', sep='/')
  }
  filenames = if('code' %in% chooser){
    c(filenames, paste(package_root, 'templates/knitr_bootstrap_code_style_toggle.html', sep='/'))
  }

  outfile = paste(package_root, 'tmp/knitr_bootstrap_full.html', sep='/')

  cat(paste(header_lines, append_files(filenames, outfile), sep='\n'), file=outfile)
  outfile
}

append_files <- function(files, output){
  paste(mapply(file_lines, files), collapse='\n')
}

file_lines <- function(file){
  stopifnot(file.exists(file))
  paste(readLines(file), collapse='\n')
}

styles = c("default", "amelia", "cerulean", "cosmo", "cyborg", "journal",
           "readable", "simplex", "slate", "spacelab", "spruce", "superhero",
           "united")

styles = c(
  'Default'='http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css',
  'Amelia'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/amelia/bootstrap.min.css',
  'Cerulean'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cerulean/bootstrap.min.css',
  'Cosmo'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cosmo/bootstrap.min.css',
  'Cyborg'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/cyborg/bootstrap.min.css',
  'Journal'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/journal/bootstrap.min.css',
  'Readable'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/readable/bootstrap.min.css',
  'Simplex'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/simplex/bootstrap.min.css',
  'Slate'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/slate/bootstrap.min.css',
  'Spacelab'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/spacelab/bootstrap.min.css',
  'Spruce'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/spruce/bootstrap.min.css',
  'Superhero'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/superhero/bootstrap.min.css',
  'United'='http://netdna.bootstrapcdn.com/bootswatch/2.3.1/united/bootstrap.min.css'
)

code_styles = c(
  'Default'='http://yandex.st/highlightjs/7.3/styles/default.min.css',
  'Dark'='http://yandex.st/highlightjs/7.3/styles/dark.min.css',
  'FAR'='http://yandex.st/highlightjs/7.3/styles/far.min.css',
  'IDEA'='http://yandex.st/highlightjs/7.3/styles/idea.min.css',
  'Sunburst'='http://yandex.st/highlightjs/7.3/styles/sunburst.min.css',
  'Zenburn'='http://yandex.st/highlightjs/7.3/styles/zenburn.min.css',
  'Visual Studio'='http://yandex.st/highlightjs/7.3/styles/vs.min.css',
  'Ascetic'='http://yandex.st/highlightjs/7.3/styles/ascetic.min.css',
  'Magula'='http://yandex.st/highlightjs/7.3/styles/magula.min.css',
  'GitHub'='http://yandex.st/highlightjs/7.3/styles/github.min.css',
  'Google Code'='http://yandex.st/highlightjs/7.3/styles/googlecode.min.css',
  'Brown Paper'='http://yandex.st/highlightjs/7.3/styles/brown_paper.min.css',
  'School Book'='http://yandex.st/highlightjs/7.3/styles/school_book.min.css',
  'IR Black'='http://yandex.st/highlightjs/7.3/styles/ir_black.min.css',
  'Solarized - Dark'='http://yandex.st/highlightjs/7.3/styles/solarized_dark.min.css',
  'Solarized - Light'='http://yandex.st/highlightjs/7.3/styles/solarized_light.min.css',
  'Arta'='http://yandex.st/highlightjs/7.3/styles/arta.min.css',
  'Monokai'='http://yandex.st/highlightjs/7.3/styles/monokai.min.css',
  'XCode'='http://yandex.st/highlightjs/7.3/styles/xcode.min.css',
  'Pojoaque'='http://yandex.st/highlightjs/7.3/styles/pojoaque.min.css',
  'Rainbow'='http://yandex.st/highlightjs/7.3/styles/rainbow.min.css',
  'Tomorrow'='http://yandex.st/highlightjs/7.3/styles/tomorrow.min.css',
  'Tomorrow Night'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night.min.css',
  'Tomorrow Night Bright'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-bright.min.css',
  'Tomorrow Night Blue'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-blue.min.css',
  'Tomorrow Night Eighties'='http://yandex.st/highlightjs/7.3/styles/tomorrow-night-eighties.min.css'
)
