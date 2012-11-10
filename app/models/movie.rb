class Movie < ActiveRecord::Base

  TMDB_FIELDS = [:title, :imdb_id]

  attr_accessible :description, :disc_number, :title, :watched

  validates :title, presence: true
  validates :description, presence: true
  validates :disc_number, presence: true

  include PgSearch
  pg_search_scope :search, against: [:title, :description]

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

end
