class CustomScrolling
  constructor: (element) ->
    @container = $(element)

    @init()

  init: () ->
    @container.mCustomScrollbar(
      scrollInertia: 0
      theme: 'dark-3'
      advanced:
        updateOnContentResize: true
        updateOnBrowserResize: true
    )

new CustomScrolling ".sidebar__fill"