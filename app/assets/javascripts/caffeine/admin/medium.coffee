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
          'table'
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
      extensions:
        table: new MediumEditorTable
          rows: 15
          columns: 15

    $(@element).mediumInsert
      editor: @editor
      addons:
        images:
          fileUploadOptions:
            url: '/admin/pictures'
            paramName: 'picture'
          uploadCompleted: ($el, data) ->
            $el.attr('image-id', data.result.files[0].id)

  _events: () ->
    $('.medium-editor-input').on 'input', ->
      $(document.getElementById($(@).data('input'))).val($(@).html())

$(document).on 'ready page:load', ->
  if $('.medium-editor-input').length
    $('.medium-editor-input').each (index, object) ->
      return new window.MediumWidget(object)
