$(document).ready(function(){

  // wrap this in if statement
  $('select').each(function(){
    var $this = $(this), numberOfOptions = $(this).children('option').length;

    $this.addClass('d-none');
    $this.wrap('<section class="select"></section>');
    $this.after('<div class="select-styled"></div>');

    var styledSelect = $this.next('div.select-styled');
    styledSelect.text($this.children('option').eq(0).text());

    var list = $('<ul />', {
        'class': 'select-options'
    }).insertAfter(styledSelect);

    for (var i = 1; i < numberOfOptions; i++) {
        $('<li />', {
            text: $this.children('option').eq(i).text(),
            rel: $this.children('option').eq(i).val()
        }).appendTo(list);
    }

    var listItems = list.children('li');

    styledSelect.click(function(e) {
        e.stopPropagation();
        $('div.select-styled.active').not(this).each(function(){
            $(this).removeClass('active').next('ul.select-options').hide();
        });
        $(this).toggleClass('active').next('ul.select-options').toggle();
    });

    listItems.click(function(e) {
        e.stopPropagation();
        styledSelect.text($(this).text()).removeClass('active');
        $this.val($(this).attr('rel'));
        list.hide();
        //console.log($this.val());
    });

    $(document).click(function() {
        styledSelect.removeClass('active');
        list.hide();
    });

  });

  $("#contact-form").submit(function(e) {
    e.preventDefault();

    var $form = $(this);
    $.post($form.attr("action"), $form.serialize()).then(function() {
      alert("Thank you!");
    });
  });


});