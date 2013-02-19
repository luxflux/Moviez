class Loan < ActiveRecord::Base
  belongs_to :borrower
  belongs_to :movie
  # attr_accessible :title, :body

  validates_presence_of :borrower, :movie
end