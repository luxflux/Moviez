Moviez.Movie = DS.Model.extend({
  id: DS.attr('number'),
  title: DS.attr('string'),
  description: DS.attr('string'),
  discNumber: DS.attr('number'),
  watched: DS.attr('boolean')
});
