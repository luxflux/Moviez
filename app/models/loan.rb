class Loan < ActiveRecord::Base
  belongs_to :borrower
  belongs_to :movie

  attr_accessible :borrower_id, :movie_id

  validates_presence_of :borrower, :movie
end
