class NavPagesModule
  constructor: (selector) ->
    @clickHandler = if 'ontouchstart' of window then "touchstart" else "click"
    @navListsSub = $(selector)
    @init()

  init: () ->
    @navListsSub.each ->
      $(this).css('display', 'none')

    elements = $('.nav__list .more-children')

    elements.on @clickHandler, ->
      currentNavListSub = $(this).parent('.nav__item--fill').next('.nav__list--sub')
      icon = $(this).find('i.iconsfont')
      currentNavListSub.slideToggle 300
      if (currentNavListSub.is(':visible') and $(this).find('i.iconsfont').hasClass('iconsfont-plus'))
        icon.removeClass('iconsfont-plus').addClass('iconsfont-minus')
      else
        icon.removeClass('iconsfont-minus').addClass('iconsfont-plus')

$ ->
  if ($('.nav__list--sub')).length
    new NavPagesModule('.nav__list--sub')