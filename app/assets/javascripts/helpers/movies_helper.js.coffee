# Movies helper file

Batman.mixin Batman.Filters,
  watched_human: (input) ->
    return if input
      'Watched'
    else
      'Not yet watched'

  label_filter: (input, cssClasses) ->
    highlight input, Moviez.get('controllers.movies.filter'), cssClasses
