# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    overview "Long text"
    tagline 'Short text'
    disc_number 1
    watched false
  end
end
