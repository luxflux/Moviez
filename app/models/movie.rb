class Movie < ActiveRecord::Base
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

end
