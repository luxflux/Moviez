class Borrower < ActiveRecord::Base

  has_many :loans, dependent: :destroy
  has_many :movies, through: :loans

  attr_accessible :email, :family_name, :first_name

  validates :email, presence: true
  validates :family_name, presence: true
  validates :family_name, presence: true
end