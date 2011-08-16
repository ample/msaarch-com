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
    c = $(this).first('img').css('border-top-color')
    w = $(this).width()
    h = $(this).height()
    $(this).hide();
    img = $("<span></span>").addClass("video").css(
      'border-color': c
      width: w
      height: h
      background: 'url(' + path + ')'
    )
    overlay = $("<span></span>").addClass("overlay").css(
      width: w
      height: h
    ).prependTo($(this).parent()).wrap(img)

  $('a[data-title]').each ->
    dimensions = $(this).attr('data-dimensions').split('x')
    padding = 5
    span = $("<span></span>").html($(this).attr('data-title')).hide().css
      'margin-top': (parseInt(dimensions[1])+padding+3)*-1
      padding: padding
      width: dimensions[0]-padding*2
      height: dimensions[1]-padding*2
    $(this).addClass('rollover')
    $(this).append(span)
    $(this).hover (->
      $(this).find('span').fadeIn()
    ), ->
      $(this).find('span').fadeOut()


