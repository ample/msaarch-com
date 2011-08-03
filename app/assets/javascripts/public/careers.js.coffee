# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  $('.sidebar .block').first().addClass('top')
  $('.sidebar .block').last().addClass('bottom')  

  $("select#market_expert").chosen().change ->
    id = $(this).val()
    $('#sidebar div[data-role]').hide(); 
    $('#sidebar div[data-role=' + id + ']').show();

  $("select#message_to_id").chosen()