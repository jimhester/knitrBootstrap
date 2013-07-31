/* run scripts when document is ready */
$(function() {
  "use strict";

  /* type of toc navigation */
  var nav = "offscreen";

  /* size of thumbnails */
  var thumbsize = "span3";

  var show_code = false;

  var show_output = true;

  var show_plot = true;

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
      button.addClass('output');
    }
    $(this).before(button);
  });

  /* onclick toggle next code block */
  $('.toggle').click(function() {
    $(this).button('toggle');
    $(this).next('div').slideToggle();
    return false;
  });

  /* give images a lightbox and thumbnail classes to allow lightbox and thumbnails TODO: make gallery if graphs are grouped */
  $('p').each(function(){
    $(this).find('img').unwrap().wrapAll('<div class="rimage default"></div>');
  });
  $('div.rimage').each(function(){
    $(this).addClass("row-fluid thumbnails");
    $(this).children('img').wrap('<a href="#" class="mfp-image ' + thumbsize + ' thumbnail"></a></li>');
  });

  /* Magnific Popup */
  $(".thumbnail").each(function(){
    $(this).magnificPopup({
      disableOn: 768,
      closeOnContentClick: true,

      type: 'image',
      items: {
        src: $(this).find('img').attr('src'),
      }
    });
  });

  /* add bootstrap classes */
  $('body').wrapInner('<div class="container-fluid"><div class="row-fluid"><div class="contents">');

  var create_language_links = function(){
    var text='';
    var language;
    for(language in languages){
      if(languages.hasOwnProperty(language)){
        text += '<li><button style="width: 100%;" class="toggle-global btn-link btn source ' + language + '" type="source.' + language + '">' + language + '</button></li>\n';
      }
    }
    return text;
  }

  /* add navbar */
  $('.container-fluid').append(
    '<div id="bottom-navbar" class="navbar-fixed-bottom navbar">\
      <div class="navbar-inner">\
        <div class="pull-right">\
          <span class="navbar-text">Toggle</span>\
          <div class="btn-group dropup" data-toggle="button-checkbox">\
            <button type="source" class="source toggle-global btn">Code</button>\
            <button class="btn dropdown-toggle" data-toggle="dropdown">\
              <span class="caret"></span>\
            </button>\
            <ul class="dropdown-menu pull-right">'
              + create_language_links() +
            '</div>\
            <button type="output" class="output toggle-global btn">Output</button>\
            <button type="thumbnails" class="thumbnails toggle-global btn">Plots</button>\
          </div>\
        </div>\
      </div>\
    </div>'
  );

  /* global toggles FIXME explicitly toggle all on/off using global variables */
  $('.toggle-global').click(function(){
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
  $('#wrap').append('<div id="push" />');
  var p = $('p:contains("Author:")');
  var last_p = p.filter(':last');
  p.detach();
  last_p.addClass('muted').attr('id','credit');
  last_p.append('<p>styled with <a href="https://github.com/jimhester/knitrBootstrap">knitrBootstrap</a></p>');
  last_p.appendTo("body");
  last_p.wrap('<div id="footer">');

  $('.container-fluid > .row-fluid').prepend('<div id="toc" class="well"/></div>');

  if(nav == 'offscreen'){
    $('#toc').wrap('<div class="meny">');
    $('.contents').addClass('span12').wrapInner('<div class="offset2 span8">');
    $('.meny').after('<div class="meny-arrow">');

    var meny = Meny.create({
        menuElement: document.querySelector( '.meny' ),
        contentsElement: document.querySelector( '.contents' ),
        position: 'left',
        width: 260
    });
  }
  else {
    $('#toc').css({ "padding-bottom": "36000px", "margin-bottom": "-36000px"}).addClass('span3');
    $('.contents').addClass('offset3 span8');
  }

  /* table of contents */
  $('#toc').tocify({extendPage: false});

  /* toggle code blocks hidden by default */
  if(show_code){
    /* toggle source buttons pressed */
    $('.source').filter(":button").addClass('active');
  }
  else {
    /* hide code blocks */
    $('div.source').toggle();
  }

  if(show_output){
    /* toggle output buttons pressed */
    $('.output').filter(":button").addClass('active');
  }
  else {
    /* hide output blocks */
    $('div.output').toggle();
  }

  if(show_plot){
    /* toggle output buttons pressed */
    $('.thumbnails').filter(":button").addClass('active');
  }
  else {
    /* hide output blocks */
    $('div.thumbnails').toggle();
  }

  /* remove paragraphs with no content */
  $('p:empty').remove();

});
