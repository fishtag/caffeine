class SearchModule
  constructor: (element) ->
    @clickHandler = if 'ontouchstart' of window then "touchstart" else "click"
    @container = $(element)

    @input = $('#search_text', @container)

    @searchResultBlock = $('.search__result', @container)
    @searchResultList = $('.search__result__list',  @container)

    @searchResultBlockRightOffset = @searchResultBlock.css('margin-right')
    @searchResultBlockLeftOffset = @searchResultBlock.css('margin-left')

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
      @search()

  search: () ->
    searchText = @input.val()
    if searchText.length > 2
      $.ajax
        url: '/admin/pages/search'
        data: 'search': searchText
        cache: false
        dataType: 'json'
        success: (response) =>
          @showResult(response.pages)
        error: () ->
          console.log 'Failed'

  scroll: () ->
    @container.find('.search__result__fill').mCustomScrollbar(
      scrollInertia: 0
      theme: 'dark-3'
      contentTouchScroll: 1
      advanced:
        updateOnContentResize: true
        updateOnBrowserResize: true
    )

  showResult: (results) =>
    htmlResults = ""
    $.each results, ->
      htmlResults += "<li class='item'>"
      htmlResults += "<div class='date'>" + @date + "</div>"
      htmlResults += "<div class='title'><a href=" + @link + ">" + @title + "</a></div>"
      htmlResults += "<div class='summary'>" + @summary + "</div>"
      htmlResults += "</li>"

    @searchResultList.html htmlResults
    @searchResultBlock.slideDown 250
    @scroll()

  hideResult: () =>
    @searchResultList.html ''
    @searchResultBlock.slideUp 250

  _isObject: (object, event) ->
    (!object.is(event.target) and object.has(event.target).length == 0)

$ ->
  if $('.module.module--search .search').length
    new SearchModule ".module.module--search .search"
