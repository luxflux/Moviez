class Movie < ActiveRecord::Base
  attr_accessible :description, :disc_number, :title, :watched
end
