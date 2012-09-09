Moviez.Router = Ember.Router.extend(
  location: 'hash'

  showHome: Ember.Route.transitionTo 'root.index'
  showAbout: Ember.Route.transitionTo 'root.about'


  root: Ember.Route.extend(

    index: Ember.Route.extend(
      route: '/'
      redirectsTo: 'movies.index'
    )

    about: Ember.Route.extend(
      route: '/about'
      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet('navigation', 'navigation')
        router.set 'navigationController.selected', 'about'
        router.get('applicationController').connectOutlet('about')
    )

    movies: Ember.Route.extend(
      route: '/movies'

      showMovie: Ember.Route.transitionTo 'show'

      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet('navigation', 'navigation')

      index: Ember.Route.extend(
        route: '/'
        connectOutlets: (router) ->
          router.set 'navigationController.selected', 'home'
          router.get('applicationController').connectOutlet('movies', Moviez.Movie.find())
      )

      show: Ember.Route.extend(
        route: '/:movie_id'
        modelType: 'Moviez.Movie'
        connectOutlets: (router, movie) ->
          router.get('applicationController').connectOutlet('movie', movie)
      )
    )
  )
)

