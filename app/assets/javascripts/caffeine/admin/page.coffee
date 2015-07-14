class Page
  constructor: (element) ->
    @container = $(element)

    @init()

  init: () ->
    @container.tabs()

new Page "#form__tabs"