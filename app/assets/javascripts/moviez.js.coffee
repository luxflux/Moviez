jQuery ->
  if $('#pagination').length
    $('#pagination').hide()
    $(window).scroll ->
      url = $('.pagination .next a').attr('href')
      if url and $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('#spinner').show()
        $('.pagination').text('')
        call_url = () ->
          $.getScript(url)
          $('#spinner').hide()
        setTimeout call_url, 1000
    $(window).scroll()
