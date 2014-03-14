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

  $(selectors.join(',')).filter(function(index) { return $(this).parent().attr("id") != 'header'; }).each(function () {

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
      imgs.parent().show();
      imgs.show();
    }
    else {
      img.slideUp(400, function(){ img.parent().hide(); });
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
    var span = $(this).find('span')
    console.log(span.hasClass('glyphicon-chevron-down'))
    toggle_block($(this), !span.hasClass('glyphicon-chevron-down'))
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
      global_toggle($(this));
    }
    return false;
  });
  /* table of contents */
  if($(['h1', 'h2', 'h3', 'h4'].join(',')).length > 0){
    $('.container > .row').append('<div class="col-md-2"><div id="toc" class="well sidebar sidenav affix hidden-print"/></div>');
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

  //TODO refresh on show/hide
  $window.on('load', function () {
    $body.scrollspy('refresh');
  })

});

