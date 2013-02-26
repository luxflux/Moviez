class Borrower < ActiveRecord::Base

  has_many :movies

  belongs_to :user

  attr_accessible :email, :family_name, :first_name

  validates :email, presence: true
  validates :first_name, presence: true
  validates :family_name, presence: true
end
