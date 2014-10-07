/* run scripts when document is ready */
$(function() {
  "use strict";

  var $window = $(window);
  var $body = $(document.body);

  /* size of thumbnails */

  var hidden_types = ['source']
  var output_types = ['output', 'message', 'warning', 'error']

  /* style tables */
  $('table').addClass('table table-striped table-bordered table-hover table-condensed');

  $('pre code').each(function(i, e) {
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

  function toggle_block(obj, show) {
    var span = obj.find('span');
    if(show === true){
      span.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
      obj.next('pre').slideDown();
    }
    else {
      span.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
      obj.next('pre').slideUp();
    }
  }

  function toggle_thumbnails(imgs, show){
    if(show === true){
      imgs.parents().show()
      imgs.slideDown();
    }
    else {
      imgs.slideUp(400, function(){ $(this).parent().hide(); });
    }
  }

  function global_toggle(obj){
    var type = obj.attr('type');
    var show = !obj.parent('li').hasClass('active');
    if(show === true){
      obj.parent('li').addClass('active');
    }
    else{
      obj.parent('li').removeClass('active');
    }
    if(type == 'figure'){
      toggle_thumbnails($('.thumbnail img'), show);
    }
    else {
      $('.toggle.' + type).each(function() { toggle_block($(this), show); });
    }
  }

  /* onclick toggle next code block */
  $('.toggle').click(function() {
    var span = $(this).find('span');
    toggle_block($(this), !span.hasClass('glyphicon-chevron-down'));
    return false
  })

  // global toggles
  $('.toggle-global').click(function(){
    var type = $(this).attr('type');
    if(type === 'all-source'){
        $('li a.source').each(function() {
          global_toggle($(this));
        });
      }
    else if(type === 'all-output'){
      $.each(output_types, function(i, val){
        console.log(val);
        global_toggle($('li a.' + val));
      });
    }
    else {
      console.log($(this));
      global_toggle($(this));
    }
    return false;
  });
  /* table of contents */
  if($(['h1', 'h2', 'h3', 'h4'].join(',')).length > 0){
    $('body > #wrap > .container > .row').append('<div class="col-md-2"><div id="toc" class="well sidebar sidenav affix hidden-print"/></div>');
    $('#toc').generate_TOC();
  }

  $.each(hidden_types, function(i, type) {
    $('li[type=' + type + ']').each(function(){ global_toggle($(this)); });
  });

  /* remove paragraphs with no content */
  $('p:empty').remove();

  $body.scrollspy({
    target: '.sidebar',
  });

  /* theme switch */
  $('.theme-switch').click(function(){
    var css = $('link[title=' + $(this).attr('title') + ']');
    $('#theme[rel=stylesheet]').attr('href', css.attr('href'));
    $('.theme-switch').closest('li').removeClass('active');
    $(this).closest('li').addClass('active');
    return false;
  });
  /* code style switch */ //TODO use same function for both of these?
  $('.highlight-switch').click(function(){
    var css = $('link[title="' + $(this).attr('title') + '"]');
    $('#highlight[rel=stylesheet]').attr('href', css.attr('href'));
    $('.highlight-switch').closest('li').removeClass('active');
    $(this).closest('li').addClass('active');
    return false;
  });

  //TODO refresh on show/hide
  $window.on('load', function () {
    $body.scrollspy('refresh');
  })

});

