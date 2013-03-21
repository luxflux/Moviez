jQuery ->

  $('.popover-trigger').popover
    html: true

  paginate = (url, total_pages, model, target) ->

    pagination_enabled = true
    current_page = 1

    $(window).scroll (event) ->
      if pagination_enabled and $(window).scrollTop() > $(document).height() - $(window).height() - 50

        pagination_enabled = false
        if current_page < total_pages
          current_page++
        else
          return

        $('#spinner').show()

        call_url = () ->
          $.getJSON url, {page: current_page}, (data, textStatus, jqXHR) ->
            if data.length > 0
              for element in data
                elements = {}
                elements[model] = element
                $(target).append poirot[model](elements)
            pagination_enabled = true
            $('#spinner').hide()


        setTimeout call_url, 750

    $(window).scroll()

  for pagination in $('#pagination')
    pagination = $(pagination)
    paginate pagination.data('url'), pagination.data('total_pages'), pagination.data('model'), pagination.data('target')
