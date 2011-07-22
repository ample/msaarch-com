# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('li.drop').hover (-> $(this).find('div.subnav').show()), (-> $(this).find('div.subnav').hide())

  $('.portfolio #alpha #videos').amplePanels
    interval: 10000
    auto: false
    width: 290
    height: 'auto'
    distance: 10
    nav: '#videos-controls',
    orientation: "horizontal"
    parent: "div"
    children: "div.feature"
    continuous: true
    keyboard_nav: true

  $("#case-studies .panels").amplePanels 
    width: 325
    height: 'auto'
    distance: 35
    per_page: 3
    nav: '#case-studies-controls',
    paged_nav: true
    auto: false
    parent: "div"
    children: "div"
    keyboard_nav: true
    rewind: true

  $('#project-imagery').amplePanels
    debug: true
    interval: 10000
    width: '100%'
    height: 449
    keyboard_nav: true
    continuous: true
    auto: true
    orientation: 'horizontal'
    clone_adjust: 2

  $("#projects-filtered").isotope 
    itemSelector: ".project"
    layoutMode: "fitRows"
    animationOptions: 
      duration: 350
      easing: 'linear'
      queue: false
    cellsByRow: 
      columnWidth: 184
      rowHeight: 360

  $("#projects-filters a").click ->
    selector = $(this).attr("data-filter")
    $("#projects-filtered").isotope filter: selector
    false

  $('#sidebar .block').first().addClass('top')
  $('#sidebar .block').last().addClass('bottom')  




