# Movies helper file

Batman.mixin Batman.Filters,
  watched_human: (input) ->
    return if input
      'Watched'
    else
      'Not yet watched'

