jQuery ->
  $('.accordion-body').live 'show', ->
    console.log this
    id = $(this).data('accordion-id')
    target = $(this).data('accordion-href')

    return unless id and target

    $.get target, (data) ->
      $(this).children('spinner').show()
      $(this).html('done')
      $(this).children('spinner').hide()

