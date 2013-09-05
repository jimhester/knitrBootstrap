/* run scripts when document is ready */

generate_anchor = function (text) {
  return text.replace(/\W/g, '_');
}
jQuery.fn.generate_TOC = function () {
  var base = $(this[0]);

  var selectors = ['h1', 'h2', 'h3', 'h4'];

  var last_ptr = [{}, {}, {}, {}];

  $(selectors.join(',')).each(function () {
    var heading = $(this);
    var idx = selectors.indexOf(heading.prop('tagName').toLowerCase());
    var itr = 0;

    while (itr <= idx) {
      if (jQuery.isEmptyObject(last_ptr[itr])) {
        last_ptr[itr] = $('<ul>').addClass('nav');
        if (itr === 0) {
          base.append(last_ptr[itr])
        } else {
          if(last_ptr[itr-1].children('li').length === 0){
            last_ptr[itr-1].append(last_ptr[itr]);
          }
          else {
            last_ptr[itr - 1].children('li').last().append(last_ptr[itr]);
          }
        }
      }
      itr++;
    }
    var anchor = generate_anchor(heading.text());
    heading.attr('id', anchor);
    var a = $('<a>')
    .text(heading.text())
    .attr('href', '#' + anchor);

  var li = $('<li>')
    .append(a);

  last_ptr[idx].append(li);
  for (i = idx + 1; i < last_ptr.length; i++) {
    last_ptr[i] = {};
  }
  });
}
$(function() {
  "use strict";

  var $window = $(window);
  var $body = $(document.body);

  document.title = $('h1').first().text();

  /* size of thumbnails */
  var thumbsize = "col-md-3";

  var show_code = false;

  var show_output = true;

  var show_figure = true;

  /* included languages */
  var languages = [];

  /* Using render_html, so add in code block */
  $('pre.knitr').each(function(){
    $(this).removeClass('knitr');
    if($(this).find('code').length < 1){
      $(this).wrapInner('<code class=' + $(this).attr('class') + '></code>');
    }
  });

  /* style tables */
  $('table').addClass('table table-striped table-bordered table-hover table-condensed');

  /* add toggle panel to rcode blocks */
  $('div.source,div.output,div.message,div.warning,div.error').each(function() {
    var button = $('<h5 class="panel-title">+/- </h5>');

    if($(this).hasClass('source')){
      var code_block = $(this).find('code');
      var lang_type = code_block.attr('class');
      button.text(button.text() + lang_type + ' Code');
      button.addClass('source ' + lang_type);
      languages[lang_type]=0;
      code_block.each(function(i, e) {
        hljs.highlightBlock(e);
      });
      $(this).addClass('panel panel-primary ' + lang_type);
    }
    else if($(this).hasClass('output')){
      button.text(button.text() + 'Output');
      button.addClass('output');
      $(this).addClass('panel panel-success');
    }
    else if($(this).hasClass('message')){
      button.text(button.text() + 'Message');
      button.addClass('message');
      $(this).addClass('panel panel-info');
    }
    else if($(this).hasClass('warning')){
      button.text(button.text() + 'Warning');
      button.addClass('warning');
      $(this).addClass('panel panel-warning');
    }
    else if($(this).hasClass('error')){
      button.text(button.text() + 'Error');
      button.addClass('error');
      $(this).addClass('panel panel-danger');
    }
    else {
      console.log($(this));
    }
    $(this).prepend($('<div class="panel-heading toggle" />').append(button));
  });

  /* give images a lightbox and thumbnail classes to allow lightbox and thumbnails TODO: make gallery if graphs are grouped */
  $('div.rimage img').each(function(){

    //remove rimage div
    $(this).unwrap();

    var a = $(this).
      wrap('<a href=# class="media-object pull-left mfp-image thumbnail ' + thumbsize + '"></a>').
      parent();

    var sibs = a.prevUntil('div.rimage,div.media');
    console.log(sibs);
    var div = $('<div class="media" />');
    if(sibs.length != 0){
      sibs.addClass('media-body');
      //need to reverse order as prevUntil puts objects in the order it found them
      $(sibs.get().reverse()).wrapAll(div).parent().prepend(a);
    }
    else {
      a.wrap(div);
    }
  });

  $('div.chunk').addClass('media');

  $('.rcode > .panel').addClass('media');
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
  $('body').wrapInner('<div class="container"><div class="row"><div class="contents">');

  var create_language_links = function(){
    var text='';
    var language;
    for(language in languages){
      if(languages.hasOwnProperty(language)){
        text += '<li><a href=# class="toggle-global source ' + language + '" type="source.' + language + '">' + language + '</a></li>\n';
      }
    }
    return text;
  }

  var navbar =
  '<div class="navbar navbar-fixed-bottom navbar-inverse">\
    <div class="container">\
      <div class="navbar-header">\
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">\
          <span class="icon-bar"></span>\
          <span class="icon-bar"></span>\
          <span class="icon-bar"></span>\
        </button>\
      </div>\
      <div id="bottom-navbar" class="navbar-collapse collapse navbar-responsive-collapse">\
        <ul class="nav navbar-nav navbar-right">\
          <li class="nav"><p class="navbar-text">Toggle</p></li>\
          <li class="dropup">\
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Code <b class="caret"></b></a>\
            <ul class="dropdown-menu">\
              <li class="dropdown-header">Languages</li>'
              + create_language_links() +
              '<li><a href="#" type="all-source" class="toggle-global">All</a></li>\
            </ul>\
          </li>\
          <li class="dropup">\
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Output <b class="caret"></b></a>\
            <ul class="dropdown-menu">\
              <li class="dropdown-header">Type</li>\
                <li><a href="#" type="output" class="toggle-global">Output</a></li>\
                <li><a href="#" type="message" class="toggle-global">Message</a></li>\
                <li><a href="#" type="warning" class="toggle-global">Warning</a></li>\
                <li><a href="#" type="error" class="toggle-global">Error</a></li>\
                <li><a href="#" type="all-output" class="toggle-global">All</a></li>\
            </ul>\
          </li>\
          <li><a href="#" class="toggle-figure">Figures</a></li>\
        </ul>\
      </div><!-- /.nav-collapse -->\
    </div><!-- /.container -->\
  </div>';
  /* add navbar */
  $('.container').append(navbar);

  /* onclick toggle next code block */
  $('.toggle').click(function() {
    $(this).next('pre').slideToggle();
    return false;
  });

  // global toggles
  $('.toggle-global').click(function(){
    var type = $(this).attr('type');
    if(type == 'all-source'){
      for(var language in languages){
        $('li a[type="source.' + language + '"]').click();
      }
    }
    if(type == 'all-output'){
      $('li a[type=output], li a[type=message], li a[type=warning], li a[type=error]').click();
    }
    else {
      if($(this).closest('li').hasClass('active')){
        $('div.' + type).children('pre').slideUp();
      }
      else {
        $('div.' + type).children('pre').slideDown();
      }
    }
    $(this).closest('li').toggleClass('active');
    return false;
  });
  // global toggles figure, this is more complicated than just slideToggle because you have to hide the parent div as well
  $('.toggle-figure').click(function(){
    var imgs = $('.thumbnail img');
    if(imgs.is(":visible")){
      imgs.slideUp(400, function(){ $(this).parent().toggle(); });
    }
    else {
      imgs.parent().show();
      imgs.show();
      //imgs.slideDown();
    }
    $(this).closest('li').toggleClass('active');
    return false;
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

  $('.container > .row').prepend('<div class="col-md-3"><div id="toc" class="well sidebar sidenav affix hidden-print"/></div>');

  $('.contents').addClass('col-md-offset-3');

  /* table of contents */
  $('#toc').generate_TOC();

  if(show_code){
    /* toggle source buttons pressed */
    $('a.toggle-global.source').closest('li').addClass('active');
  }
  else {
    /* hide code blocks */
    $('div.source pre').hide();
  }

  if(show_output){
    /* toggle output buttons pressed */
    $('li a[type=output], li a[type=message], li a[type=warning], li a[type=error], li a[type=all-output]').closest('li').addClass('active');
  }
  else {
    /* hide output blocks */
    $('div.output pre').hide();
  }

  if(show_figure){
    /* toggle figure button pressed */
    $('li a.toggle-figure').closest('li').addClass('active');
  }
  else {
    /* hide figures */
    $('.thumbnail').hide();
  }

  /* remove paragraphs with no content */
  $('p:empty').remove();

  $body.scrollspy({
    target: '.sidebar',
  });

  $window.on('load', function () {
    console.log('harst');
    $body.scrollspy('refresh');
  })

});

