# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  $("select#team_member").chosen().change ->
    id = $(this).val()
    permalink = $('div[id=member-' + id + ']').attr('data-permalink')
    window.location = '/team/' + permalink

