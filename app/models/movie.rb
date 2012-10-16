class Movie < ActiveRecord::Base
  attr_accessible :description, :disc_number, :title, :watched

  validates :title, presence: true
  validates :description, presence: true
  validates :disc_number, presence: true

  def self.text_search(query)
    if query.present?
      search query
    else
      scoped
    end
  end

end
