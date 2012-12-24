class Movie < ActiveRecord::Base

  TMDB_FIELDS = [:title, :imdb_id, :overview, :tagline]

  attr_accessible :overview, :disc_number, :title, :watched, :tagline

  validates :title, :overview, presence: true
  validates :disc_number, numericality: { only_integer: true }, allow_nil: true

  include PgSearch
  pg_search_scope :search, against: [:title, :overview]

  before_validation :set_default_for_watched

  def self.text_search(query)
    if query.present?
      search query
    else
      scoped
    end
  end

  def load_attributes_from_tmdb_data(tmdb_data)
    TMDB_FIELDS.each do |attr|
      tmdb_value = tmdb_data.send(attr)
      send("#{attr}=", tmdb_value)
    end
    self
  end

  def set_default_for_watched
    self.watched = false if self.watched.nil?
    true
  end

end
