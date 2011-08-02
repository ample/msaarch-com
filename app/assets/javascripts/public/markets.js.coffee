# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  $('.portfolio #alpha #videos').amplePanels
    auto: false
    width: 290
    height: 'auto'
    distance: 10
    nav: '#videos-controls',
    orientation: "horizontal"
    parent: "div"
    children: "div.feature"
    continuous: true
    keyboard_nav: false

  $("#case-studies .panels").amplePanels 
    auto: false
    width: 290
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

  $("#projects-filters a, #projects-filters input").click ->
    if this.nodeName == 'A'
      check = (if $(this).prev().attr("checked") then false else true)
      $(this).prev().attr("checked", check);
    filters = []
    $.each $("#projects-filters input:checked"), (i, el) ->
      filters.push $(el).attr("data-filter")
    $("#projects-filtered").isotope filter: filters.join(',')
    false unless this.nodeName == 'INPUT'

