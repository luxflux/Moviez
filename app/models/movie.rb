class Movie < ActiveRecord::Base

  TMDB_FIELDS = [:title, :imdb_id, :overview, :tagline]

  attr_accessible :overview, :disc_number, :title, :watched, :tagline, :tmdb_id

  belongs_to :user
  has_many :loans, dependent: :destroy
  has_many :borrowers, through: :loans

  validates :title, :overview, :tmdb_id, presence: true
  validates :disc_number, numericality: { only_integer: true }, allow_nil: true
  validates :tmdb_id, numericality: { only_integer: true }
  validates :disc_number, uniqueness: true, allow_nil: true

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
    load_direct_mappings_from_tmdb_data(tmdb_data)
    load_image_url_from_tmbd_data(tmdb_data)
    load_tmdb_id_from_tmbd_data(tmdb_data)
    self
  end

  def set_default_for_watched
    self.watched = false if self.watched.nil?
    true
  end

  def load_direct_mappings_from_tmdb_data(tmdb_data)
    TMDB_FIELDS.each do |attr|
      tmdb_value = tmdb_data.send(attr)
      send("#{attr}=", tmdb_value)
    end
  end

  def load_image_url_from_tmbd_data(tmdb_data)
    self.image_url = tmdb_data.posters.first.sizes.w154.url
  end

  def load_tmdb_id_from_tmbd_data(tmdb_data)
    self.tmdb_id = tmdb_data.id
  end

end
