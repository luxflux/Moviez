class Moviez.Movie extends Batman.Model
  @resourceName: 'movie'
  @storageKey: 'movies'
  @persist Batman.RailsStorage

  @encode 'title', 'description', 'disc_number', 'watched'

