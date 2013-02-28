jQuery ->

  $('.data-toggler .visible-true').show()
  $('.data-toggler .visible-false').hide()

  $('.data-toggler').on 'click', (event) ->
    element = $(this)

    target = element.data('toggle-target')
    $(".#{target}").toggle()
