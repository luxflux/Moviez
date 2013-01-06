jQuery ->

  available_elements = ['spinner', 'nothing_found', 'placeholder']

  content_changed = (input) ->
    $(input).data('last-check-value') == $(input).val()

  show_element = (element_to_show) ->

    elements = jQuery.grep available_elements, (value) ->
      value != element_to_show

    $("##{element_to_show}").show()

    for element in elements
      $("##{element}").hide()

  hide_elements = () ->
    for element in available_elements
      $("##{element}").hide()

  search_callback = (input, element_name, replace_target) ->

    return unless content_changed(input)

    if input.value == ''
      $('#spinner').hide()
      return

    form = $(input).parents 'form'
    url = form.attr 'action'
    formData = form.serialize()

    $.ajax url + '.json',
      type: form.attr('method'),
      data: formData,
      success: (data) ->
        replace_target.html('')

        if data.length > 0
          for element in data
            elements = {}
            elements[element_name] = element
            replace_target.append poirot[element_name](elements)
            hide_elements()
        else
          show_element 'nothing_found'


      error: (xhr, status, error) ->
        console.log status
        console.log error
        show_element 'nothing_found'


  for input in $('input[data-observe-multiple]')

    element_name = $(input).data('observe-multiple')
    observe_timer = $(input).data('observe-timer') || 2
    replace_target = $('#' + $(input).data('observe-target'))

    # catch enter
    $(input).keydown (event) ->
      if event.keyCode == 13
        event.preventDefault()
        search_callback input, element_name, replace_target

    $(input).observe_field 0.2, () ->
      show_element 'spinner'

      unless content_changed(input)
        hide_elements()
      else
        $(input).data('last-check-value', $(input).val())

      if input.value == ''
        hide_elements()

    $(input).observe_field observe_timer, () ->
      search_callback input, element_name, replace_target
