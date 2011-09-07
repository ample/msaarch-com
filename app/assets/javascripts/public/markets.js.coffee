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
  $('.portfolio #alpha #videos').css({'display':'block','opacity',0}).fadeIn(); 

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
      check = (if $(this).parent().prev().attr("checked") then false else true)
      $(this).parent().prev().attr("checked", check);
      $(this).parent().prev().prev().prev().toggleClass('on');
    filters = []
    $.each $("#projects-filters input:checked"), (i, el) ->
      filters.push $(el).attr("data-filter")
    $("#projects-filtered").isotope filter: filters.join(',')
    false unless this.nodeName == 'INPUT'

  # stylized checkboxes
  $('#projects-filters input[type=checkbox]').each ->
    $(this).hide();
    link = $('<a href="#" class="checkbox"></a>').click ->
      $(this).next().next().next().find('a:first-child').trigger('click')
      false
    $(this).prev().before(link)

