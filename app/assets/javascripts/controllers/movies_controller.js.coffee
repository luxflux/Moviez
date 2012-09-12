class Moviez.MoviesController extends Batman.Controller

  routingKey: 'movies'

  index: (params) ->
    Moviez.Movie.load (err,results) =>
      @set 'movies', results

  show: (params) ->
    @set 'movie', Moviez.Movie.find parseInt(params.id, 10), (err) ->
      throw err if err

  create: (params) ->

  update: (params) ->

  destroy: (params) ->


  @accessor 'filtered_movies',
    get: ->
      movies = Moviez.get('Movie.all')
      if filter = @get('filter')
        movies.filter (movie) ->
          title = movie.get('title')
          description = movie.get('description')
          pattern = build_filter_regexp filter
          (title and title.match(pattern)) or (description and description.match(pattern))
      else
        movies
