Moviez.Movie = DS.Model.extend({
  title: DS.attr('string'),
  description: DS.attr('string'),
  discNumber: DS.attr('number'),
  watched: DS.attr('boolean')
});
