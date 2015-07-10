class NavComponentsModule
  constructor: (selector) ->
    @elements = $(selector)
    @parentElement = @elements.parent('.nav__list')

    @closeTimeout = null

    @currentItem = null

#    @init()

    if !('ontouchstart' of window)
      @init()

  init: () ->
    @elements.hover (event) =>
      @hoverIn event
    , (event) =>
      @hoverOut event

    $(document).on 'mouseover', (event) =>
      if @_isItem(@parentElement, event) and @currentItem
        clearTimeout @closeTimeout
        @elements.animate { opacity: 1 }, 0
        @currentItem = null

  hoverIn: (event) ->
    clearTimeout @closeTimeout
    thisItem = $(event.currentTarget)
    @elements.filter(thisItem).animate { opacity: 1 }, 100
    if !@currentItem
      @elements.not(thisItem).animate { opacity: 0.6 }, 200
    else
      @elements.not(thisItem).animate { opacity: 0.6 }, 0

  hoverOut: (event) ->
    @currentItem = $(event.currentTarget)
    @closeTimeout = setTimeout((=>
      @elements.animate { opacity: 1 }, 0
    ), 500)

  _isItem: (object, event) ->
    (!object.is(event.target) and object.has(event.target).length == 0)

$ ->
  if $('.nav.nav--components li').length
    new NavComponentsModule('#content .nav.nav--components li')