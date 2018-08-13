$(document).ready(function(){

  if ($(".tpl-contact")[0]) {

    // Rebuilds the select menu so it can be styled
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
        styledSelect.addClass('selected');
        // console.log($this.val());

        var customText = $('[data-role=email-custom-subject]'),
          style = $('div.select-styled')
        if (styledSelect.text() == 'Write your own') {
          customText.removeClass('d-none');
        } else {
          customText.addClass('d-none');
        }
      });

      $(document).click(function() {
        styledSelect.removeClass('active');
        list.hide();
      });

    });

    $("#contact-form").submit(function(e) {
      e.preventDefault();
      var $form = $(this);

      $form.validate({
        submitHandler: function(form) {
          $('[data-role=email-alert]').hide();
          $.post($form.attr("action"), $form.serialize()).then(function() {
            $('[data-role=email-form]').hide();
            $('[data-role=email-success]').show();
          });
        },

        invalidHandler: function(event, validator){

          var errors = validator.numberOfInvalids();
          if (errors) {
            var message = errors == 1
            ? 'Please correct the error highlighted above'
            : 'Please correct the errors highlighted above';
            $('[data-role=email-message]').html(message);
            $('[data-role=email-alert]').show();
          } else {
            $('[data-role=email-alert]').hide();
          }
        }
      });

    });

  }
});