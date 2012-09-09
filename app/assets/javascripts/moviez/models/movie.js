Moviez.Movie = DS.Model.extend({
  title: DS.attr('string'),
  description: DS.attr('string'),
  discNumber: DS.attr('number'),
  watched: DS.attr('boolean'),

  watched_human: function() {
    if(this.get('watched')) {
      return 'Watched';
    } else {
      return 'Not yet watched';
    }
  }.property('watched')

});
