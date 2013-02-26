jQuery ->

  $(':input[data-typeahead-url]').each () ->
    element = $(this)
    element.typeahead
      source: (query, process) ->
        $.getJSON element.attr('data-typeahead-url'), q: query, (data) ->
          element.labels = []
          element.mapped = {}

          $.each data, (i, item) ->
            label = item.title_value
            id = item.id
            element.labels.push label
            element.mapped[label] = id

          process element.labels
      updater: (item) ->
        $("##{element.data('typeahead-target')}").val(element.mapped[item])
        item
