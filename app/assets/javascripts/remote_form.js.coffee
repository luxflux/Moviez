jQuery ->

  handle_remote_form_errors = (response) ->
    try
      responseText = jQuery.parseJSON response.responseText
    catch error
      responseText = null

    if responseText
      responseText.error
    else
      'There was an unknown error or the request timed out. Please try again later';

  $('form[data-remote=true]').on 'ajax:error', (event, response, error) ->
    $('#error_explanation').html handle_remote_form_errors(response)


