# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('li.drop').hover (-> $(this).find('div.subnav').show()), (-> $(this).find('div.subnav').hide())

$ ->
  $('.portfolio #alpha #videos').amplePanels
    interval: 5000
    width: 290
    height: 'auto'
    distance: 10
    nav: '#videos-controls',
    orientation: "horizontal"
    parent: "div"
    children: "div.feature"
    continuous: true
    keyboard_nav: true
