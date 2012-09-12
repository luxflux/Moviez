window.build_filter_regexp = (what) ->
  new RegExp '(' + what +  ')', 'gi'


window.highlight = (content, what, spanClass) ->
  return content unless what
  return content unless content

  pattern = build_filter_regexp what
  replaceWith = '<span class="' + spanClass + '">$1</span>'

  content.replace(pattern, replaceWith)
