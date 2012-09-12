class Moviez.MoviesController extends Batman.Controller

  routingKey: 'movies'

  index: (params) ->
    Moviez.Movie.load (err,results) =>
      @set 'movies', results

  show: (params) ->

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

