class Moviez.MoviesController extends Batman.Controller

  routingKey: 'movies'

  index: (params) ->
    Moviez.Movie.load (err,results) =>
      @set 'movies', results

  show: (params) ->
    @set 'movie', Moviez.Movie.find parseInt(params.id, 10), (err) ->
      throw err if err

  new: (params) ->
    @set 'movie', new Moviez.Movie()
    @form = @render()

  create: (params) ->
    @get('movie').save (err) =>
      $('#new_movie').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Moviez.flashSuccess "#{@get('movie.title')} added successfully!"
        @redirect 'routes.movies'

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
