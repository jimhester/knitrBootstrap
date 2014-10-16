`%||%` <- function(x, y) { if(is.null(x)){ y } else { x } }

tags = list(
            a = function(...) tag("a", list(...)),
            b = function(...) tag("b", list(...)),
            button = function(...) tag("button", list(...)),
            code = function(...) tag("code", list(...), add_newline = FALSE),
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

tag = function(type, arg_list, add_newline = TRUE){
  named_idx = nzchar(names(arg_list))
  named_idx = if(length(named_idx) == 0) FALSE else named_idx

  newline = if (add_newline) { "\n" } else { "" }
  paste0('<', type, ' ', print_attributes(arg_list[named_idx]), '>',
         paste0(unlist(arg_list[!named_idx]), collapse='\n'), '</', type,'>', newline)
}


generate_attribute = function(index, data) {
  paste0(names(data)[index], '="', paste0(data[[index]], collapse=' '), '"')
}

print_attributes = function(attributes) {
  paste0(vapply(seq_along(attributes), FUN.VALUE=character(1),
                FUN=generate_attribute, USE.NAMES=FALSE, attributes), collapse= ' ')

}
