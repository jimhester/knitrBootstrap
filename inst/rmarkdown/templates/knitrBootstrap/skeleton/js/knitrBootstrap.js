/* run scripts when document is ready */
$(function() {
  "use strict";

  var $window = $(window);
  var $body = $(document.body);

  /* size of thumbnails */

  var hidden_types = ['source']
  var output_types = ['output', 'message', 'warning', 'error']

  /* add well class to toc */
  $('#toc').addClass("well");
  
  /* add nav class to ul in toc */
  $('#toc ul').each(function() {
    $(this).addClass("nav")
  });

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

  /* onclick toggle next code block */
  $('.toggle').click(function() {
    var span = $(this).find('span');
    toggle_block($(this), !span.hasClass('glyphicon-chevron-down'));
    return false
  })

});

