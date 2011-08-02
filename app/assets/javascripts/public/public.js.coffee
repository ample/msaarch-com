# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # market drop-down nav
  $('li.drop').hover (-> $(this).find('div.subnav').show()), (-> $(this).find('div.subnav').hide())

  # add/remove borders on top/bottom sidebar blocks
  $('#sidebar .block').first().addClass('top')
  $('#sidebar .block').last().addClass('bottom')  

  # video modal windows
  $('a[data-video-id]').click ->
    $.colorbox
      iframe: true
      href: 'http://www.youtube.com/embed/' + $(this).attr('data-video-id')
      innerWidth: 640
      innerHeight: 390
      transition: 'none'
    false

  # video overlay
  $("a[data-video-id] img").each ->
    path = $(this).attr('src')
    w = $(this).width()
    h = $(this).height()
    $(this).hide();
    img = $("<span></span>").addClass("video").css(
      width: w
      height: h
      background: 'url(' + path + ')'
    )
    overlay = $("<span></span>").addClass("overlay").css(
      width: w
      height: h
    ).prependTo($(this).parent()).wrap(img)

