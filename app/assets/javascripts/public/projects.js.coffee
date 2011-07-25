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
    clone_adjust: 2

  $('#sidebar .block').first().addClass('top')
  $('#sidebar .block').last().addClass('bottom')  

  