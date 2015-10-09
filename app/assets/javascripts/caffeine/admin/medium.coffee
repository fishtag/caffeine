class window.MediumWidget
  constructor: (element) ->
    @element = element
    @placeholder = $('#' + $(@element).data('input')).attr 'placeholder'
    @_init()
    @_events()

  _init: () ->
    @editor = new MediumEditor @element,
      targetBlank: true
      buttonLabels: 'fontawesome'
      placeholder:
        text: @placeholder
      toolbar:
        buttons: [
          'bold'
          'italic'
          'underline'
          'anchor'
          'quote'
          'h1'
          'h2'
          'h3'
          'unorderedlist'
          'orderedlist'
          'justifyLeft'
          'justifyCenter'
          'justifyRight'
        ]
      anchor:
        placeholderText: 'Укажите ссылку'
        targetCheckbox: true
        targetCheckboxText: 'Открывать в новой вкладке'
      paste:
        forcePlainText: true
        cleanPastedHTML: true
        cleanAttrs: ['style', 'dir']
        cleanTags: ['label', 'meta', 'script', 'p']

    $(@element).mediumInsert {
      editor: @editor
      addons:
        images:
          fileUploadOptions:
            url: '/admin/upload'
    }

  _events: () ->
    $('.medium-editor-input').on 'input', ->
      $(document.getElementById($(@).data('input'))).val($(@).html())

$(document).on 'ready page:load', ->
  if $('.medium-editor-input').length
    $('.medium-editor-input').each (index, object) ->
      return new window.MediumWidget(object)