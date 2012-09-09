Moviez.movieView = Ember.View.extend({
  templateName: 'moviez/templates/movie',
  moviesBinding: 'Moviez.moviesController',

  refreshListing: function() {
    Moviez.moviesController.findAll();
  }
});
