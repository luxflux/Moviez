jQuery ->

  $('.data-toggler .true').show()
  $('.data-toggler .false').hide()

  $('.data-toggler').on 'click', (event) ->
    element = $(this)

    target = element.data('toggle-target')
    $(".#{target}").toggle()
