jQuery ->

  class MultipleObserver

    @available_elements = ['spinner', 'nothing_found', 'placeholder']

    constructor: (input) ->
      @input = $(input)
      @element_name = $(@input).data('observe-multiple')
      @observe_timer = $(@input).data('observe-timer') || 2
      @replace_target = $('#' + $(@input).data('observe-target'))

      @catch_enter()
      @observe_changes()
      @observe_changes_with_search()


    content_changed: () ->
      @last_check_value != @input.val()

    show_element: (element_to_show) =>

      elements_to_hide = jQuery.grep MultipleObserver.available_elements, (value) ->
        value != element_to_show

      $("##{element_to_show}").show()

      for element in elements_to_hide
        $("##{element}").hide()

    hide_elements: () ->
      for element in MultipleObserver.available_elements
        $("##{element}").hide()

    search_callback: =>

      if @content_changed()
        @last_check_value = @input.val()
      else
        return

      if @input.val() == ''
        $('#spinner').hide()
        return

      form = @input.parents 'form'
      url = form.attr 'action'
      formData = form.serialize()

      $.ajax url + '.json',
        type: form.attr('method'),
        data: formData,
        success: (data) =>
          @replace_target.html('')

          if data.length > 0
            for element in data
              elements = {}
              elements[@element_name] = element
              @replace_target.append poirot[@element_name](elements)
              @hide_elements()
          else
            @show_element 'nothing_found'


        error: (xhr, status, error) =>
          console.log status
          console.log error
          @show_element 'nothing_found'

    catch_enter: () ->
      @input.keyup () =>
        @show_element 'spinner'
        @hide_elements() unless @content_changed()
        @hide_elements() if @input.val() == ''

      @input.keydown (event) =>
        if event.keyCode == 13
          event.preventDefault()

    observe_changes: () ->
      @input.observe_field 0.2, () =>

    observe_changes_with_search: () ->
      @input.observe_field @observe_timer, () =>
        @search_callback()

  for input in $('input[data-observe-multiple]')

    observer = new MultipleObserver(input)

