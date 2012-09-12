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

