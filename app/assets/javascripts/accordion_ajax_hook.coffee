jQuery ->
  $('.accordion-body').live 'show', ->
    element = $(this)
    id = element.data('accordion-id')
    target = element.data('accordion-href')

    return unless id and target

    element.children('.spinner').show()

    $.get target, (data) ->
      console.log data
      element.html(poirot.moviePreview(data))
      element.children('.spinner').hide()

