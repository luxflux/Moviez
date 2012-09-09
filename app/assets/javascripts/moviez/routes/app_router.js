Moviez.Router = Ember.Router.extend({
  location: 'hash',

  root: Ember.Route.extend({

    index: Ember.Route.extend({
      route: '/',
      redirectsTo: 'movies.index'
    }),

    movies: Ember.Route.extend({
      route: '/movies',
      showMovie: Ember.Route.transitionTo('show'),

      index: Ember.Route.extend({
        route: '/',
        connectOutlets: function(router) {
          router.get('applicationController').connectOutlet('movies', Moviez.Movie.find());
        }
      }),

      show: Ember.Route.extend({
        route: '/:movie_id',
        modelType: 'Moviez.Movie',
        connectOutlets: function(router, movie) {
          router.get('applicationController').connectOutlet('movie', movie);
        }
      })
    })
  })
});

