jQuery ->
  for input in $('input[data-observe-multiple]')

    element_name = $(input).data('observe-multiple')
    observe_timer = $(input).data('observe-timer') || 2
    replace_target = $('#' + $(input).data('observe-target'))

    $(input).observe_field observe_timer, ->
      return if input.value == ''
      $('#placeholder').hide()
      $('#spinner').show()

      form = $(this).parents 'form'
      url = form.attr 'action'
      formData = form.serialize()

      $.ajax url + '.json', type: form.attr('method'), data: formData, success: (data) ->
        replace_target.html('')

        for element in data
          elements = {}
          elements[element_name] = element
          replace_target.append poirot[element_name](elements)

        $('#spinner').hide()
