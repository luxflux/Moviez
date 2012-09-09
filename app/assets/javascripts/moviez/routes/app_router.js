Moviez.Router = Ember.Router.extend({
  location: 'hash',

  root: Ember.Route.extend({
    index: Ember.Route.extend({
      route: '/',
      redirectsTo: 'movies'
    }),
    movies: Ember.Route.extend({
      route: '/movies',
      connectOutlets: function(router) {
        router.get('applicationController').connectOutlet('movies', Moviez.Movie.find());
      }
    }),
    movie: Ember.Route.extend({
      route: '/movie/:movie_id',
      connectOutlets: function(router, movie) {
        router.get('applicationController').connectOutlet('movie', movie);
      }
    })
  })
});

