$(document).ready(function(){
  if($('.tpl-market').length > 0) {
    $('ul.pagination').hide();
    urls = $('ul.pagination > li > a').map(function(a){ return $(this).attr('href') }).get();
    n = 0;
    $('[data-role=load-more]').click(function(e) {
      e.preventDefault();
      n++;
      if(url = urls[n]) {
        $.get(url, function(data){
          html = $(data).find('.block-projects').html();
          $('.block-projects').append(html);
          imgix.init();
        });
      }
      if(n == urls.length -1) {
        $('[data-role=load-more]').hide();
      }
    });
  }
});