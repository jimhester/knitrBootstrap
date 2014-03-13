// Function to generate the dynamic table of contents
jQuery.fn.generate_TOC = function () {
  var base = $(this[0]);

  var selectors = ['h1', 'h2', 'h3', 'h4'];

  var last_ptr = [{}, {}, {}, {}];

  var anchors = {};

  generate_anchor = function (text) {
    var test = text.replace(/\W/g, '_');

    while(test in anchors){
      //if no suffix, add one
      if(test.match(/_\d+$/) === null){
        test = test + "_2";
      }
      //else generate unique id for duplicates by adding one to the suffix
      else {
        test = test.replace(/_(\d+)$/, function(match, number){ var num=+number+1; return("_" + num) });
      }
    }
    anchors[test]=1;
    return(test);
  }

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
/* run scripts when document is ready */
$(function() {
  "use strict";

  var $window = $(window);
  var $body = $(document.body);

  //document.title = $('h1').first().text();

  /* size of thumbnails */
  var thumbsize = "col-md-3";

  var show_code = false;

  var show_output = true;

  var show_figure = true;

  /* included languages */
  var languages = [];

  /* style tables */
  $('table').addClass('table table-striped table-bordered table-hover table-condensed');

  $('div pre code').each(function(i, e) {
    hljs.highlightBlock(e);
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

  /* onclick toggle next code block */
  $('.toggle').click(function() {
    var span = $(this).find('span')
    if(span.hasClass('glyphicon-chevron-down')){
      span.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up')
    }
    else {
      span.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down')
    }
    $(this).next('pre').slideToggle();
    return false;
  });

  // global toggles
  $('.toggle-global').click(function(){
    var type = $(this).attr('type');
    if(type === 'all-source'){
      for(var language in languages){
        $('li a[type="source.' + language + '"]').click();
      }
    }
    if(type === 'all-output'){
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
    }
    $(this).closest('li').toggleClass('active');
    return false;
  });


  $('.container > .row').append('<div class="col-sm-3 col-sm-offset-1"><div id="toc" class="well sidebar sidenav affix hidden-print"/></div>');

  /* table of contents */
  $('#toc').generate_TOC();

  function toggle_block(setting, type){
    if(setting === 'true'){
      $('a.toggle-global.' + type).closest('li').addClass('active');
    }
    else if(setting.length > 0){ //a list of types to toggle
      $('a.toggle-global.' + type).each(function(){
        var has_class = false;
        for(var i = 0;i < setting.length;i++){
          var val = setting[i];
          console.log(val);
          console.log($(this));
          if($(this).hasClass(val)){
            has_class = true;
          }
        }
        console.log(has_class);
        if(has_class){
          $(this).closest('li').addClass('active');
        }
        else {
          $('div.' + $(this).attr('type')).children('pre').hide();
        }
      });
    }
    else {
      $('div.' + type + ' pre').hide();
    }
  }

  toggle_block(show_code, 'source');

  toggle_block(show_output, 'output');

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


  //TODO refresh on show/hide
  $window.on('load', function () {
    $body.scrollspy('refresh');
  })

});

