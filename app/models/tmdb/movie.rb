class TMDB::Movie

  ATTRIBUTE_MAPPING = {
    imdb_id: :imdb_id
  }


  attr_accessor *ATTRIBUTE_MAPPING.map { |key,value| key }
  attr_accessor :cast


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
  end

  def load_attributes
    ATTRIBUTE_MAPPING.each do |local_key, tmdb_key|
      tmdb_value = @raw.send(tmdb_key)
      self.send("#{local_key}=", tmdb_value)
    end
  end

  def load_cast
    self.cast = @raw.cast
  end

end
