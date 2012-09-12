class Movie < ActiveRecord::Base
  attr_accessible :description, :disc_number, :title, :watched

  validates :title, presence: true
  validates :description, presence: true
  validates :disc_number, presence: true

end
