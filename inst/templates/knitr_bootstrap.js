/* run scripts when document is ready */
$(function() {
  "use strict";

  /* size of thumbnails */
  var thumbsize = "span5";

  /* included languages */
  var languages = [];

  /* Using render_html, so add in code block */
  $('pre.knitr').each(function(){
    $(this).removeClass('knitr');
    if($(this).find('code').length < 1){
      $(this).wrapInner('<code class=' + $(this).attr('class') + '></code>');
    }
  });

  /* Add div wrapping class to code blocks without them */
  $('pre code').each(function(){

    var block_type, code_type;
    /* output block */
    if($(this).hasClass('')){
      block_type = "output";
      code_type = "";
    }
    /* source code block */
    else{
      block_type = "source";
      code_type = $(this).attr('class');
    }
    /* no wrapping div, not using render_html(), so add to wrap */
    if($(this).closest('div').length < 1){
      $(this).parent().wrap('<div class="' + [block_type, code_type].join(" ") + '"></div>');
    }
    /* just add code type to the parent div */
    else{
      $(this).closest('div').addClass(code_type);
    }
  });

  /* style tables, set them as output*/
  $('table').addClass('table table-striped table-bordered table-hover table-condensed')
    .wrap('<div class="output" style="overflow: auto"/>');

  /* find all code or output blocks which have a class and add toggle */
  $('div.source, div.output').each(function() {
    var button = $('<button class="btn-mini btn-link btn toggle" data-toggle="button">+/- </button>');

    /* code block */
    if($(this).hasClass('source')){
      var code_block = $(this).find('code');
      var lang_type = code_block.attr('class');
      button.text(button.text() + lang_type + ' Code');
      button.addClass('source ' + lang_type);
      languages[lang_type]=0;
      code_block.each(function(i, e) {
        hljs.highlightBlock(e);
      });
    }

    /* output block */
    else {
      button.text(button.text() + 'Output');
      button.addClass('output active');
    }
    $(this).before(button);
  });

  /* syntax highlight code blocks*/

  /* onclick toggle next code block */
  $('.toggle').click(function() {
    $(this).button('toggle');
    $(this).next('div').slideToggle();
    return false;
  });


  /* toggle code blocks hidden by default */
  $('div.source').toggle();

  /* give images a fancybox and thumbnail classes to allow lightbox and thumbnails TODO: make fancybox prev next if grouped */
  $('p').each(function(){
    $(this).find('img').unwrap().wrapAll('<div class="rimage default"></div>');
  });
  $('div.rimage').each(function(){
    $(this).addClass("row-fluid thumbnails");
    $(this).children('img').wrap('<a href="#" class="' + thumbsize + ' thumbnail"></a></li>').addClass('fancybox');
  });

  /* fancybox */
  $(".fancybox").each( function() {
    var img = $(this);
    $(this).fancybox({
      afterClose: function(){
        img.css('display', 'block');
      }
    });
  });

  /* add bootstrap classes */
  $('body').wrapInner('<div class="container-fluid"><div class="row-fluid"><div class="span12 contents">');
  $('.container-fluid >.row-fluid').prepend('<div class="meny"><div id="toc" class="well" /></div><div class="meny-arrow" />');

  /* add table of contents */
  $('#toc').tocify({extendPage: false});

  $('#toc').addClass('meny');

  /*add meny*/
  var meny = Meny.create({
      menuElement: document.querySelector( '.meny' ),
      contentsElement: document.querySelector( '.contents' ),
      position: 'left',
      width: 260
  });


  var create_language_links = function(){
    var text='';
    var language;
    for(language in languages){
      if(languages.hasOwnProperty(language)){
        text += '<li><a href="#" class="source toggle-global btn-link btn" type="source.' + language + '">' + language + '</a></li>\n';
      }
    }
    return text;
  }

  /* add navbar */
  $('.container-fluid').prepend(
    '<div id="bottom-navbar" class="navbar-fixed-bottom navbar">\
      <div class="navbar-inner">\
        <div class="pull-right">\
          <span class="navbar-text">Toggle</span>\
          <div class="btn-group dropup" data-toggle="button-checkbox">\
            <button type="source" class="toggle-global btn">Code</button>\
            <button class="btn dropdown-toggle" data-toggle="dropdown">\
              <span class="caret"></span>\
            </button>\
            <ul class="dropdown-menu pull-right">'
              + create_language_links() +
            '</div>\
            <button type="output" class="toggle-global btn active">Output</button>\
            <button type="thumbnails" class="toggle-global btn active">Plots</button>\
          </div>\
        </div>\
      </div>\
    </div>'
  );

  /* global toggles FIXME explicitly toggle all on/off using global variables */
  $('.toggle-global').click(function(){
    $(this).button('toggle');
    var type = $(this).attr('type');
    $('.' + type).button('toggle');
    $('div.' + type).slideToggle();
    return false;
  });

  /* if using render_html() hook, make functions links to custom R search */
  /*search in ggplot documentation or inside-r.org */
  $("span.functioncall").replaceWith(function(){

    return '<a target="_blank" href="http://www.google.com/search?sourceid=navclient&gfns=1&\
q=site:docs.ggplot2.org/current OR site:inside-r.org ' +
    $(this).text() + '">' + $(this).text()+'</a>'
  });

  /* add footer */
  $('body').wrapInner('<div id="wrap" />');
  $('body').append('<div id="push" />');
  var p = $('p:contains("Author:")');
  var last_p = p.filter(':last');
  p.detach();
  last_p.addClass('muted').attr('id','credit');
  last_p.append('<p>styled with <a href="https://github.com/jimhester/knitr_bootstrap">knitr_bootstrap</a></p>');
  last_p.appendTo("body");
  last_p.wrap('<div id="footer"><div class="container" /></div>');
});
