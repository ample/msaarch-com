# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  $("select#team_member").chosen().change ->
    id = $(this).val()
    permalink = $('div[id=member-' + id + ']').attr('data-permalink')
    window.location = '/team/' + permalink

  $('#events div.events').each ->
    rh = 0
    $(this).find("div").each ->
      rh += $(this).height()
      rh += parseInt($(this).css("padding-top"),10) + parseInt($(this).css("margin-top"),10) + parseInt($(this).css("borderTopWidth"),10)
      rh += parseInt($(this).css("padding-bottom"),10) + parseInt($(this).css("margin-bottom"),10) + parseInt($(this).css("borderBottomWidth"),10)
    diff = 456 - rh
    $(this).find('div.dark').css('padding-bottom',diff) 

  $('#events').amplePanels
    auto: false
    width: '100%'
    height: 500
    keyboard_nav: true
    continuous: true
    orientation: 'horizontal'
    clone_adjust: 3
    next: '#events-next'
    previous: '#events-previous'
    duration : 300
    easing: 'easeOutQuad'

  $("#events-next span.wrap, #events-previous span.wrap").hide(); 
  $("#events-next, #events-previous").hover (->
    $(this).find('span.wrap').fadeIn()
  ), -> $(this).find('span.wrap').fadeOut()

  $('#events, section#controls').fadeTo(0,0).css('visibility','visible').delay(500).fadeTo(400,1)
  

