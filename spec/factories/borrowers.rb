# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :borrower do
    first_name "John"
    family_name "Doe"
    email "mail@example.org"
    user
  end
end
