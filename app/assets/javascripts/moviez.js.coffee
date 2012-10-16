jQuery ->
  for input in $('input[data-observe]')
    $(input).observe_field $(input).data('observe'), ->
      $("#spinner").show()
      form = $(this).parents 'form'
      url = form.attr 'action'
      formData = form.serialize()

      $.get url, formData, (html) ->
        $('#movies').html(html)
        $('#spinner').hide()
