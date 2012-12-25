# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    overview "Long text"
    tagline 'Short text'
    tmdb_id 1337
    disc_number 1
  end
end
