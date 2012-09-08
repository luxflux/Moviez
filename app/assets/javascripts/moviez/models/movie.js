Moviez.Movie = DS.Model.extend({
  title: DS.attr(''),
  description: DS.attr('string'),
  discNumber: DS.attr('integer'),
  watched: DS.attr('boolean')
});