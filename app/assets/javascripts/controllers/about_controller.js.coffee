class Moviez.AboutController extends Batman.Controller

  routingKey: 'about'

  index: (params) ->
    Moviez.Movie.load (err,results) =>
      @set 'movies', results

