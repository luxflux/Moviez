class Borrower < ActiveRecord::Base
  attr_accessible :email, :family_name, :first_name
end
