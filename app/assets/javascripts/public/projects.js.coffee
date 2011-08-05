# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#project-imagery').amplePanels
    auto: false
    width: '100%'
    height: 449
    keyboard_nav: true
    continuous: true
    orientation: 'horizontal'
    clone_adjust: 3
    next: '#project-imagery-next'
    previous: '#project-imagery-previous'

    $("#project-imagery-next span.wrap, #project-imagery-previous span.wrap").hide(); 
    $("#project-imagery-next, #project-imagery-previous").hover (->
      $(this).find('span.wrap').fadeIn()
    ), -> $(this).find('span.wrap').fadeOut()
