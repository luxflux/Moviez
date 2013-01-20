class TMDB::Movie

  class Cache

    def self.find(options)
      Rails.cache.fetch self.cache_path(options) do
        TmdbMovie.find options
      end
    end

    private
    def self.cache_path(args)
      args.flatten.join('/')
    end

  end

  ATTRIBUTES = [
    :id,
    :title,
    :release_date,
    :imdb_id,
    :tagline,
    :runtime,
    :overview
  ]


  attr_accessor *ATTRIBUTES
  attr_accessor :cast, :spoken_languages, :posters, :genres


  def initialize(tmdb_data)
    @raw = tmdb_data
    load_from_data
    self
  end

  def self.find_by_id(id)
    self.new TMDB::Movie::Cache.find(id: id, expand_results: true)
  end

  def self.search(search_parameters)
    search_parameters.merge!(expand_results: false)
    search_result = TMDB::Movie::Cache.find(search_parameters)
    if search_result.respond_to?(:map)
      search_result.map do |result|
        self.new result
      end
    else
      [self.new(search_result)]
    end
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
