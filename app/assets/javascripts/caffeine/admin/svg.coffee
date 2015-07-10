class window.SVG
  constructor: (selector = '.svg') ->
    @elements = $(selector)
    @init()

  init: () ->
    @elements.each ->
      $img = $(this)
      imgID = $img.attr('id')
      imgClass = $img.attr('class')
      imgURL = $img.attr('src')
      $.get imgURL, ((data) ->
        # Get the SVG tag, ignore the rest
        $svg = $(data).find('svg')
        # Add replaced image's ID to the new SVG
        if typeof imgID != 'undefined'
          $svg = $svg.attr('id', imgID)
        # Add replaced image's classes to the new SVG
        if typeof imgClass != 'undefined'
          $svg = $svg.attr('class', imgClass + ' replaced-svg')
        # Remove any invalid XML tags as per http://validator.w3.org
        $svg = $svg.removeAttr('xmlns:a')
        # Replace image with new SVG
        $img.replaceWith $svg
        return
      ), 'xml'
      return

$ ->
  setTimeout () ->
    window.svg = new SVG()
  , 1000