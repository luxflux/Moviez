class TMDB::Movie

  ATTRIBUTES = [
    :id,
    :title,
    :release_date,
    :imdb_id,
    :tagline,
    :runtime,
  ]


  attr_accessor *ATTRIBUTES
  attr_accessor :cast, :spoken_languages, :posters, :genres


  def initialize(tmdb_data)
    @raw = tmdb_data
    load_from_data
    self
  end

  def self.find_by_id(id)
    self.new TmdbMovie.find(id: id, expand_results: true)
  end


  private
  def load_from_data
    load_attributes
    load_cast
    load_spoken_languages
    load_posters
    load_genres
  end

  def load_attributes
    ATTRIBUTES.each do |name|
      tmdb_value = @raw.send(name)
      self.send("#{name}=", tmdb_value)
    end
  end

  def load_cast
    self.cast = @raw.cast
  end

  def load_spoken_languages
    self.spoken_languages = @raw.spoken_languages
  end

  def load_posters
    self.posters = @raw.posters
  end

  def load_genres
    self.genres = @raw.genres
  end

end
