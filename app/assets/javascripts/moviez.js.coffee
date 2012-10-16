jQuery ->
  for input in $('input[data-observe]')
    $(input).observe_field $(input).data('observe'), ->
      $("#spinner").show()
      form = $(this).parents 'form'
      url = form.attr 'action'
      formData = form.serialize()

      $.get url + '.json', formData, (data) ->
        $('#movies').html('')
        for movie in data
          $('#movies').append poirot.movie(movie)
        $('#spinner').hide()
