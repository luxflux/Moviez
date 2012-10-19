jQuery ->
  $('.accordion-body').live 'show', ->
    element = $(this)
    id = element.data('accordion-id')
    target = element.data('accordion-href')

    return unless id and target

    element.children('.accordion-inner').children('.spinner').show()

    $.get target, (data) ->
      console.log data
      element.children('.accordion-inner').append(poirot.moviePreview(data))
      element.children('.accordion-inner').children('.spinner').hide()

