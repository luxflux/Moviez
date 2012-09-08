# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    description "MyText"
    disc_number 1
    watched false
  end
end
