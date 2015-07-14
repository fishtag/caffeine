class SearchModule
  constructor: (element) ->
    @clickHandler = if 'ontouchstart' of window then "touchstart" else "click"
    @container = $(element)
    @searchTimeout = null
    @input = $('#search_text', @container)
    @searchResultBlock = $('.search__result', @container)
    @searchResultBlockLeftOffset = @searchResultBlock.css('margin-left')
    @searchResultBlockRightOffset = @searchResultBlock.css('margin-right')
    @splash = $('.splash-block')

    @init()

  init: () ->
    @searchResultBlock.css({
      display: 'none'
      position: 'absolute'
      left: @searchResultBlockLeftOffset
      right: @searchResultBlockRightOffset
    })

    @input.focus =>
      @splash.css(
        display: 'block'
      ).animate({
        opacity: '0.6'
        }, 250)

    $(document).on @clickHandler, (event) =>
      if @_isObject(@container, event)
        @splash.animate({
          opacity: 0
        }, 250).hide(1)

        @input.val('')

        @hideResult()

    @input.keyup =>
      @searchTimeout = setTimeout((=>
        @search()
      ), 500)

  search: () ->
    searchText = @input.val()
    console.log searchText
#    $.ajax
#      type: 'POST'
#      url: '#'
#      data: 'search': search
#      cache: false
#      success: (response) ->
#        @showResult()
#        @scroll()
#        $('#resSearch').html response
#        return

  scroll: () ->
    @container.find('.search__result__fill').mCustomScrollbar(
      scrollInertia: 0
      theme: 'dark-3'
      contentTouchScroll: 1
      advanced:
        updateOnContentResize: true
        updateOnBrowserResize: true
    )

  showResult: () =>
    @searchResultBlock.slideDown 250

  hideResult: () =>
    @searchResultBlock.slideUp 250

  _isObject: (object, event) ->
    (!object.is(event.target) and object.has(event.target).length == 0)

$ ->
  if $('.module.module--search .search').length
    new SearchModule ".module.module--search .search"